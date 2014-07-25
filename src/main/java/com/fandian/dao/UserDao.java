package com.fandian.dao;

import com.fandian.bean.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by gan on 14-7-25.
 */
@Repository
public class UserDao extends JdbcTemplate{

    @Resource(name="dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource(){
        super.setDataSource(this.dataSource);
    }

    public int insertUser(final User user){
        KeyHolder keyHolder = new GeneratedKeyHolder();
        update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

                PreparedStatement ps = connection.prepareStatement(
                    "insert into user (name,open_id) values(?,?) ", Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getName());
                ps.setString(2, user.getOpenId());

                return ps;
            }
        }, keyHolder);
        return keyHolder.getKey().intValue();
    }

    public void updateUser(User user){
        update("update user set name=?,open_id=? where id = ?",user.getName(),user.getOpenId(),user.getId());
    }

    public void deleteUser(int userId){
        update("delete from user where id = ?",userId);
    }


}
