package com.fandian.model;

import com.fandian.bean.Dish;

/**
 * Created by zhijieliu on 2014/7/25.
 */
public class DishOrderInfo {
    private Dish dish;
    private int number;

    public DishOrderInfo() {
    }

    public DishOrderInfo(Dish dish, int number) {
        this.dish = dish;
        this.number = number;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
