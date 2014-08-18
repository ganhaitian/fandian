package com.fandian.model;

import com.fandian.bean.Dish;
import com.fandian.bean.Taste;
import com.fandian.bean.Weight;

/**
 * Created by zhijieliu on 2014/7/25.
 */
public class DishOrderInfo {
    private Dish dish;
    private Taste taste;
    private Weight weight;
    private float number;
    private float fee;
    //去除口味、分量因素的总数量
    private float totalNumber;

    public DishOrderInfo() {
    }

    public DishOrderInfo(Dish dish, Taste taste, Weight weight, float number) {
        //默认值是单价，如果后面有份量和口味，则再更新
        this.fee = (dish.getPrice());
        setDish(dish);
        setTaste(taste);
        setWeight(weight);
        setNumber(number);
        setTotalNumber(number);
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public float getNumber() {
        return number;
    }

    public void setNumber(float number) {
        this.number = number;
        /*if (weight != null && weight.getPrice_relate()){
            this.fee = this.dish.getPrice()*this.number*this.weight.getPrice_ratio();
        }else{
            this.fee = this.dish.getPrice()*this.number;
        }*/
    }

    public Taste getTaste() {
        return taste;
    }

    public void setTaste(Taste taste) {
        this.taste = taste;
    }

    public Weight getWeight() {
        return weight;
    }

    public void setWeight(Weight weight) {
        this.weight = weight;
        if(weight != null && weight.getPrice_relate()){
            this.fee = this.fee * weight.getPrice_ratio();
        }
    }

    public float getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(float totalNumber) {
        this.totalNumber = totalNumber;
    }
}
