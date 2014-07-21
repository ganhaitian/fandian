package com.fandian.bean;

/**
 * Created by gan on 14-7-21.
 */
public class BillDetail {

    private int id;

    private int billId;

    private int dishId;

    private int dishName;

    private int amout;

    private int price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getDishId() {
        return dishId;
    }

    public void setDishId(int dishId) {
        this.dishId = dishId;
    }

    public int getDishName() {
        return dishName;
    }

    public void setDishName(int dishName) {
        this.dishName = dishName;
    }

    public int getAmout() {
        return amout;
    }

    public void setAmout(int amout) {
        this.amout = amout;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
