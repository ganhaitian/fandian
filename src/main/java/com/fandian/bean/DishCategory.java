package com.fandian.bean;

import java.util.List;

/**
 * Created by gan on 14-7-21.
 */
public class DishCategory {

    private int id;

    private String name;

    private List<DishCategory> childCategories;


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

    public List<DishCategory> getChildCategories() {
        return childCategories;
    }

    public void setChildCategories(List<DishCategory> childCategories) {
        this.childCategories = childCategories;
    }

}
