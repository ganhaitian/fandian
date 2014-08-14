package com.fandian.dao;

import com.fandian.bean.Customer;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Date;
import java.util.List;

/**
 * Created by gan on 14-7-30.
 */
@Repository
public class CustomerDao extends JdbcTemplate {

    @Resource(name = "dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource() {
        super.setDataSource(this.dataSource);
    }

    public Customer getCustomerById(int customerId) {
        try {
            return queryForObject("select * from customer where id = ?",
                BeanPropertyRowMapper.newInstance(Customer.class), customerId);
        } catch (Exception e) {
            return null;
        }
    }

    public List<Customer> getAllCustomers() {
        return query("select * from customer ", BeanPropertyRowMapper.newInstance(Customer.class));
    }

    public void insertCustomer(Customer customer) {
        update("insert into customer(name) values(?)", customer.getName());
    }

    public void updateCustomer(Customer customer) {
        update("update customer set name = ?,unsettle_fee = ?,last_settle_time = ? where id = ?",
            customer.getName(), customer.getUnsettleFee(), customer.getLastSettleTime(), customer.getId());
    }

    public void deleteCustomer(int customerId) {
        update("delete from customer where id = ?", customerId);
    }

    public void updateCheckoutInfo(int customerId) {
        update("update customer set unsettle_fee = 0 where id = ?", customerId);
    }

    public void updateCustomerFee(int customerId, float fee) {
        update("update customer set unsettle_fee = unsettle_fee + ?,last_settle_time = ? where id = ?", fee, new Date(), customerId);
    }
}
