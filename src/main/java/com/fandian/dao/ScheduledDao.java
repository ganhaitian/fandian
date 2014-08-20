package com.fandian.dao;

import com.fandian.bean.Schedule;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by gan on 14-8-20.
 */
@Repository
public class ScheduledDao extends JdbcTemplate{

    public List<Schedule> getBookRecords(String date,int area){
        return query("select * from scheduled where book_date = ? and table_no like ? ",
            BeanPropertyRowMapper.newInstance(Schedule.class),date,area + "%");
    }

    public List<Schedule> getBookRecords(String date){
        return query("select * from scheduled where book_date = ? ",
            BeanPropertyRowMapper.newInstance(Schedule.class),date);
    }

}
