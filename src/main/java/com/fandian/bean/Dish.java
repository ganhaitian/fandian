package com.fandian.bean;

import java.io.Serializable;

/**
 * Created by gan on 14-7-21.
 */
public class Dish implements Serializable{

    private static final long serialVersionUID = 1L;

    private int id;

    private String name;

    private int price;

    private String detail;

    private int sales;

    private int stars;

    private int categoryId;

    private String picPath;

    private int unitId;

    private String unitName;

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        if(picPath == null){
            this.picPath = "";
        }else
            this.picPath = picPath;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getSales() {
        return sales;
    }

    public void setSales(int sales) {
        this.sales = sales;
    }
}
