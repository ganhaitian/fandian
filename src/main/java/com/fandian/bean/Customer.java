package com.fandian.bean;


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by gan on 14-7-30.
 */
public class Customer {

    private int id;

    private String name;

    private float unsettleFee;

    private Date lastSettleTime;

    private String lastSettleTimeStr;

    public String getLastSettleTimeStr() {
        return this.lastSettleTimeStr;
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

    public float getUnsettleFee() {
        return unsettleFee;
    }

    public void setUnsettleFee(float unsettleFee) {
        this.unsettleFee = unsettleFee;
    }

    public Date getLastSettleTime() {
        return lastSettleTime;
    }

    public void setLastSettleTime(Date lastSettleTime) {
        this.lastSettleTime = lastSettleTime;
        if(lastSettleTime != null){
            lastSettleTimeStr = new SimpleDateFormat("yyyy-MM-dd H:m:s").format(this.lastSettleTime);
        }
    }
}
