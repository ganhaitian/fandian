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

    public List<Schedule> getBookRecords(String date,String area){
        return query("select * from scheduled where book_date = ? and table_no like ? ",
            BeanPropertyRowMapper.newInstance(Schedule.class),date,area + "%");
    }

    public List<Schedule> getBookRecords(String date){
        return query("select * from scheduled where book_date = ? ",
            BeanPropertyRowMapper.newInstance(Schedule.class),date);
    }

    public void insertSchedule(Schedule schedule) {
        update("insert into scheduled (customer_name,book_date,table_no,phone_num,meals_num) values(?,?,?,?,?)",
        schedule.getCustomerName(),schedule.getBookDate(),schedule.getTableNo(),schedule.getPhoneNum(),schedule.getMealsNum());
    }

    public void updateSchedule(Schedule schedule) {
        update("update scheduled set customer_name = ?,book_date=?,table_no=?,phone_num=?,meals_num=? where id = ?",
            schedule.getCustomerName(),schedule.getBookDate(),schedule.getTableNo(),
            schedule.getPhoneNum(),schedule.getMealsNum(),schedule.getId());
    }

    public void delSchedule(int scheduleId){
        update("delete from scheduled where id = ?",scheduleId);
    }
}
