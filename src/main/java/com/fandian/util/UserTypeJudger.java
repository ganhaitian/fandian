package com.fandian.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;

import java.util.Iterator;
import java.util.Set;

/**
 * Created by zhijieliu on 2014/8/6.
 * 判断用户类型
 */
public class UserTypeJudger {

    public static final String ROLE_WAITOR = "ROLE_WAITOR";
    public static final String ROLE_CUSTOMER = "ROLE_USER";

    /**
     * 是否为服务员
     * @param authentication
     * @return
     */
    public static boolean isWaitor(Authentication authentication){
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        return roles.contains(ROLE_WAITOR);

    }

    /**
     * 是否为顾客
     * @param authentication
     * @return
     */
    public static boolean isCustomer(Authentication authentication){
        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        return roles.contains(ROLE_CUSTOMER);
    }
}
