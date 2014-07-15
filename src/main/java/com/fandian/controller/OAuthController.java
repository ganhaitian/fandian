package com.fandian.controller;

import com.fandian.model.OauthAccessTokenDetail;
import com.fandian.util.ConfigurationFactory;
import com.fandian.util.HttpConnectUtil;
import com.fandian.util.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by zhijieliu on 2014/7/15.
 */
@Controller
@RequestMapping("/oauth")
public class OAuthController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private HttpConnectUtil httpConnectUtil;

    @Resource
    private JSONUtil jsonUtil;
    /**
     *"https://open.weixin.qq.com/connect/oauth2/authorize?
     * appid=APPID&
     * redirect_uri=REDIRECT_URI&
     * response_type=code&
     * scope=SCOPE&
     * state=STATE
     * #wechat_redirect"
     */

    @RequestMapping("/authorize")
    public void redirectToGrantAuthPage(HttpServletRequest request, HttpServletResponse response){
        StringBuffer buffer = new StringBuffer();
        try {
            buffer.append(ConfigurationFactory.getGlobalConfiguration().getString("oauth_authorize_uri") + "?");
            buffer.append("appid=" + ConfigurationFactory.getGlobalConfiguration().getString("weixin_appid"));
            buffer.append("&redirect_uri=" + URLEncoder.encode(ConfigurationFactory.getGlobalConfiguration().getString("oauth_redirect_uri"),"UTF-8"));
            buffer.append("&response_type=code");
            buffer.append("&scope=snsapi_base");
            buffer.append("&state=test");
            buffer.append("#wechat_redirect");


            response.sendRedirect(buffer.toString());
        } catch (Exception e) {
            logger.warn("跳转微信oauth页面异常",e);
        }
    }

    @RequestMapping("/entry")
    public String fetchAccessToken(ModelMap model,HttpServletRequest request, HttpServletResponse response){
        String code = request.getParameter("code");
        if (StringUtils.isEmpty(code)){

            return "oauth/fail";

        }else{
            //appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
            StringBuffer buffer = new StringBuffer();
            buffer.append(ConfigurationFactory.getGlobalConfiguration().getString("oauth_access_token_uri") + "?");
            buffer.append("appid=" + ConfigurationFactory.getGlobalConfiguration().getString("weixin_appid"));
            buffer.append("&secret=" + ConfigurationFactory.getGlobalConfiguration().getString("weixin_appsecret"));
            buffer.append("&code=" + code);
            buffer.append("&grant_type=authorization_code");

            String jsonRes = httpConnectUtil.get(buffer.toString(),"UTF-8");

            if (jsonRes.contains("errcode")){
                logger.warn("oauth获取access_token失败");
                return "oauth/fail";
            }else{
                OauthAccessTokenDetail oauthAccessTokenDetail = jsonUtil.transJsonToBeanByGson(jsonRes, OauthAccessTokenDetail.class);
                logger.info("user openid:" + oauthAccessTokenDetail.getOpenid());
                model.addAttribute("openid",oauthAccessTokenDetail.getOpenid());
                return "admin/user/infoedit";
            }


        }
    }

    @RequestMapping("/fail")
    public String authorizedFailEnty(){
        return "oauth/fail";
    }
}
