package com.fandian.controller;

import com.fandian.bean.User;
import com.fandian.dao.UserDao;
import com.fandian.model.OauthAccessTokenDetail;
import com.fandian.model.OauthUserInfo;
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

    private static final String DEFAULT_PASSWORD = "4be85f53b208246362dbc07372269eaef29600a1e7f17ace94d1530470193e5e";

    @Resource
    private HttpConnectUtil httpConnectUtil;

    @Resource
    private JSONUtil jsonUtil;

    @Resource
    private UserDao userDao;
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
            buffer.append("&scope=snsapi_userinfo");
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
                if (fetchUserInfo(oauthAccessTokenDetail.getAccess_token(),oauthAccessTokenDetail.getOpenid(),oauthAccessTokenDetail.getRefresh_token())){
                    model.addAttribute("openid",oauthAccessTokenDetail.getOpenid());
                    return "admin/user/weixinlogin";
                }else{
                    logger.warn("oauth获取userinfo失败");
                    return "oauth/fail";
                }

            }


        }
    }

    private String refreshAccessToken(){
        return "";
    }

    private boolean fetchUserInfo(String access_token, String open_id, String refresh_token){
        StringBuffer buffer = new StringBuffer();
        buffer.append(ConfigurationFactory.getGlobalConfiguration().getString("oauth_userinfo_uri") + "?");
        buffer.append("access_token=" + access_token);
        buffer.append("&openid=" + open_id);
        buffer.append("&lang=zh_CN");

        String jsonRes = httpConnectUtil.get(buffer.toString(),"UTF-8");
        if (jsonRes.contains("errcode")){
            logger.warn("oauth获取user_info失败");
            return false;
        }else{
            OauthUserInfo oauthUserInfo = jsonUtil.transJsonToBeanByGson(jsonRes,OauthUserInfo.class);
            User user = new User();
            user.setUsername(open_id);
            user.setPassword(DEFAULT_PASSWORD);
            user.setEnabled(1);
            user.setInternal(0);
            String authority = null;
            try {
                authority = userDao.findUserAuthority(open_id);
            } catch (Exception e) {

            }
            if (StringUtils.isEmpty(authority)){
                authority = "ROLE_USER";
            }
            user.setAuthority(authority);
            user.setAccess_token(access_token);
            user.setRefresh_token(refresh_token);
            user.setUsernamecn(oauthUserInfo.getNickname());
            user.setHeadimg_url(oauthUserInfo.getHeadimgurl());
            if (!userDao.hasUser(open_id)){

                userDao.insertUser(user);
            }else{
                userDao.updateUser(user);
            }
            return true;
        }
    }

    @RequestMapping("/fail")
    public String authorizedFailEnty(){
        return "oauth/fail";
    }
}
