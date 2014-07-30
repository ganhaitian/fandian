package com.fandian.dao;

import com.fandian.bean.Customer;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

/**
 * Created by gan on 14-7-30.
 */
@Repository
public class CustomerDao extends JdbcTemplate{

    @Resource(name = "dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource() {
        super.setDataSource(this.dataSource);
    }

    public List<Customer> getAllCustomers(){
       return query("select * from customer ", BeanPropertyRowMapper.newInstance(Customer.class));
    }

    public void insertCustomer(Customer customer){
        update("insert into customer(name) values(?)",customer.getName());
    }

    public void updateCustomer(Customer customer){
        update("update customer set name = ?,unsettle_fee = ?,last_settle_time = ? where id = ?",
            customer.getName(),customer.getUnsettleFee(),customer.getLastSettleTime(),customer.getId());
    }

    public void deleteCustomer(int customerId){
        update("delete from customer where id = ?",customerId);
    }

}
