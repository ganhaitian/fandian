package com.fandian.controller;

import com.fandian.bean.User;
import com.fandian.dao.UserDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by gan on 14-7-22.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Inject
    private UserDao userDao;

    @Inject
    public JSONUtil jsonUtil;

    @RequestMapping("/listInternal")
    public
    @ResponseBody
    String listInternal() {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("data", userDao.getInternalUsers());
        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/updateUser")
    public
    @ResponseBody
    String updateUser(@RequestParam String param) {
        //try{
        User user = jsonUtil.transJsonToBeanByGson(param, User.class);
        user.setInternal(1);
        if (!userDao.hasUser(user.getUsername())) {
            userDao.insertUser(user);
        } else
            userDao.updateUser(user);
        return "{\"success\":true}";
        /*}catch(Exception e){
            e.printStackTrace();
            return "{\"success\":false}";
        }*/
    }

    @RequestMapping("/delUser")
    public @ResponseBody String delUser(@RequestParam String username){
        userDao.deleteUser(username);
        return "{\"success\":true}";
    }

}
