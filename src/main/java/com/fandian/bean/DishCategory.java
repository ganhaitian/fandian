package com.fandian.bean;

import java.util.List;

/**
 * Created by gan on 14-7-21.
 */
public class DishCategory {

    private int id;

    private String name;

    private List<DishCategory> childCategories;

    private int parentId;
    private int dish_count;

    public int getDish_count() {
        return dish_count;
    }

    public void setDish_count(int dish_count) {
        this.dish_count = dish_count;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
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

    public List<DishCategory> getChildCategories() {
        return childCategories;
    }

    public void setChildCategories(List<DishCategory> childCategories) {
        this.childCategories = childCategories;
    }

}
