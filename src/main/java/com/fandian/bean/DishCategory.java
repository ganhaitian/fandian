package com.fandian.bean;

import java.util.List;

/**
 * Created by gan on 14-7-21.
 */
public class DishCategory {

    private int id;

    private String name;

    private int parent_id;

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

    public int getParent_id() {
        return parent_id;
    }

    public void setParent_id(int parent_id) {
        this.parent_id = parent_id;
    }

    public List<DishCategory> getChildCategories() {
        return childCategories;
    }

    public void setChildCategories(List<DishCategory> childCategories) {
        this.childCategories = childCategories;
    }
}
