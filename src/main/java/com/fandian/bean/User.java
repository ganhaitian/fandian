package com.fandian.bean;

/**
 * Created by gan on 14-7-25.
 */
public class User {

    private int id;

    private String username;

    private String password;

    private String usernamecn;

    private String openId;

    private int enabled;

    private String authority;

    private int internal;

    private String access_token;
    private String refresh_token;
    private String headimg_url;


    public int getInternal() {
        return internal;
    }

    public void setInternal(int internal) {
        this.internal = internal;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getUsernamecn() {
        return usernamecn;
    }

    public void setUsernamecn(String usernamecn) {
        this.usernamecn = usernamecn;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    public String getHeadimg_url() {
        return headimg_url;
    }

    public void setHeadimg_url(String headimg_url) {
        this.headimg_url = headimg_url;
    }
}
