package com.fandian.bean;

import java.util.List;

/**
 * Created by zhijieliu on 2014/7/21.
 */
public class DishListOfCustomerView {
    private String typeid;
    private String href;
    private String name;
    private List<DishCustomerView> info;

    public String getTypeid() {
        return typeid;
    }

    public void setTypeid(String typeid) {
        this.typeid = typeid;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<DishCustomerView> getInfo() {
        return info;
    }

    public void setInfo(List<DishCustomerView> info) {
        this.info = info;
    }
}
