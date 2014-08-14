package com.fandian.bean;

/**
 * Created by zhijieliu on 2014/8/12.
 * 菜品分量
 */
public class Weight {

    private int id;
    private String code;
    private String name;

    private boolean price_relate;

    private float price_ratio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean getPrice_relate() {
        return price_relate;
    }

    public void setPrice_relate(boolean price_relate) {
        this.price_relate = price_relate;
    }

    public float getPrice_ratio() {
        return price_ratio;
    }

    public void setPrice_ratio(float price_ratio) {
        this.price_ratio = price_ratio;
    }
}
