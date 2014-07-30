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

}
