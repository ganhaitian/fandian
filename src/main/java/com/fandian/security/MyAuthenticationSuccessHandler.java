package com.fandian.security;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhijieliu on 2014/7/29.
 */
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private String defaultTargetUrl = "/";

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    public String getDefaultTargetUrl() {
        return defaultTargetUrl;
    }

    public void setDefaultTargetUrl(String defaultTargetUrl) {
        this.defaultTargetUrl = defaultTargetUrl;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String ru = (String)request.getSession().getAttribute(LoginUrlEntryPoint.LOGIN_SUCC_TARGET_URL);
        request.getSession().removeAttribute(LoginUrlEntryPoint.LOGIN_SUCC_TARGET_URL);
        if(StringUtils.isEmpty(ru)){
            ru = defaultTargetUrl;
            //request.getRequestDispatcher(ru).forward(request, response);
        }
        redirectStrategy.sendRedirect(request,response,ru);
    }
}
