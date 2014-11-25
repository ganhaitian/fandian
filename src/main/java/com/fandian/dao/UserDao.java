package com.fandian.dao;

import com.fandian.bean.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

/**
 * Created by gan on 14-7-25.
 */
@Repository
public class UserDao extends JdbcTemplate {

    @Resource(name = "dataSource")
    private DataSource dataSource;

    @PostConstruct
    public void initDataSource() {
        super.setDataSource(this.dataSource);
    }

    public List<User> getInternalUsers() {
        List<User> users = query("select * from users where internal = 1 ", BeanPropertyRowMapper.newInstance(User.class));
        for (User user : users) {
            user.setAuthority(
                queryForObject("select ifnull(authority,\"\") from authorities where username = ?",
                    String.class, user.getUsername())
            );
        }
        return users;
    }

    public boolean hasUser(String username) {
        int userNumber = queryForObject("select count(*) from users where username = ?", Integer.class, username);
        if (userNumber > 0)
            return true;
        else
            return false;
    }

    public void insertUser(final User user) {
        super.update("insert into users (username,usernamecn,password,open_id,enabled,internal,access_token,refresh_token,headimg_url) values(?,?,?,?,?,?,?,?,?) ",
            user.getUsername(), user.getUsernamecn(), user.getPassword(), user.getOpenId(), user.getEnabled(), user.getInternal(),user.getAccess_token(),
                user.getRefresh_token(),user.getHeadimg_url());
        super.update("insert into authorities (username,authority) values(?,?)", user.getUsername(), user.getAuthority());
    }

    public void updateUser(User user) {
        update("update users set usernamecn=?,password=?,open_id=?,enabled=?,access_token=?,refresh_token=?,headimg_url=? where username = ?",
            user.getUsernamecn(), user.getPassword(), user.getOpenId(), user.getEnabled(),user.getAccess_token(),
                user.getRefresh_token(),user.getHeadimg_url(), user.getUsername());
        update("update authorities set authority = ? where username = ?", user.getUsername(), user.getAuthority());
    }

    public void deleteUser(String userName) {
        update("delete from users where username = ?", userName);
    }


}
