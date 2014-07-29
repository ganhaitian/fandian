package com.fandian.security;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.util.RedirectUrlBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zhijieliu on 2014/7/29.
 */
public class LoginUrlEntryPoint extends LoginUrlAuthenticationEntryPoint {
    public static final String LOGIN_SUCC_TARGET_URL = "_login_success_target_url";

    public LoginUrlEntryPoint(String loginFormUrl) {
        super(loginFormUrl);
    }

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        if (request.getSession().getAttribute(LOGIN_SUCC_TARGET_URL) == null) {
            request.getSession().setAttribute(LOGIN_SUCC_TARGET_URL, buildHttpReturnUrlForRequest(request));
        }
        super.commence(request, response, e);
    }

    protected String buildHttpReturnUrlForRequest(HttpServletRequest request)
            throws IOException, ServletException {


        RedirectUrlBuilder urlBuilder = new RedirectUrlBuilder();
        urlBuilder.setScheme("http");
        urlBuilder.setServerName(request.getServerName());
        urlBuilder.setPort(request.getServerPort());
        urlBuilder.setContextPath(request.getContextPath());
        urlBuilder.setServletPath(request.getServletPath());
        urlBuilder.setPathInfo(request.getPathInfo());
        urlBuilder.setQuery(request.getQueryString());

        return urlBuilder.getUrl();
    }
}
