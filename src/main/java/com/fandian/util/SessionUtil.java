package com.fandian.util;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by zhijieliu on 2014/11/11.
 */
@Service
public class SessionUtil {
    //缓存桌号
    public static final String SESSION_SCAN_DESK_NUMBER_KEY = "_fandian_scan_desk_num";
    //缓存是否存在用户预约信息状态
    public static final String SESSION_SCHEDULE_EXIST_KEY = "_fandian_customer_schedule_exist";
    //缓存预约用户手机号码
    public static final String SESSION_USER_BOOK_PHONE_KEY = "_fandian_user_book_phone";

    public void addObjectToSession(String key, Object o, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (session == null){
            session = request.getSession(true);
        }
        session.setAttribute(key,o);
    }


    public <T>T fetchObjectFromSession(String key,HttpServletRequest request,Class<T> clazz){
        HttpSession session = request.getSession();
        if (session == null){
            return null;
        }
        return (T) session.getAttribute(key);
    }

    public void removeObjectFromSession(String key, HttpServletRequest request){
        HttpSession session = request.getSession();
        if (session == null){
            return ;
        }
        session.removeAttribute(key);
    }
}
