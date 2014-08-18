package com.fandian.bean;

import com.sun.org.apache.xml.internal.serializer.SerializationHandler;

import java.io.Serializable;

/**
 * Created by gan on 14-7-21.
 */
public class BillDetail implements Serializable {

    private static final long serialVersionUID = 1L;

    private int id;

    private int billId;

    private int dishId;

    private String dishName;

    private float amount;

    private float price;

    private int weight;
    private int taste;

    public BillDetail(){

    }

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

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amout) {
        this.amount = amout;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getTaste() {
        return taste;
    }

    public void setTaste(int taste) {
        this.taste = taste;
    }
}
