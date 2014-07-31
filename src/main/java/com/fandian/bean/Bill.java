package com.fandian.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by gan on 14-7-22.
 */
public class Bill {

    private int id;

    private int tableNo;

    private int status;

    private int fee;

    private float actualFee;

    private float discount;

    private int paymentType;

    private String userName = "";

    private Date createTime;

    private String createTimeStr;

    private List<BillDetail> billDetails;

    private String operator = "";

    private int lossesCustomerId;

    private String lossesCustomerName = "";

    public String getCreateTimeStr() {
        return createTimeStr;
    }

    public void setCreateTimeStr(String createTimeStr) {
        this.createTimeStr = createTimeStr;
    }

    public int getLossesCustomerId() {
        return lossesCustomerId;
    }

    public void setLossesCustomerId(int lossesCustomerId) {
        this.lossesCustomerId = lossesCustomerId;
    }

    public String getLossesCustomerName() {
        return lossesCustomerName;
    }

    public void setLossesCustomerName(String lossesCustomerName) {
        if(lossesCustomerName == null)
            return;
        this.lossesCustomerName = lossesCustomerName;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        if(operator == null)
            return;
        this.operator = operator;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(int paymentType) {
        this.paymentType = paymentType;
    }

    public float getActualFee() {
        return actualFee;
    }

    public void setActualFee(float actualFee) {
        this.actualFee = actualFee;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<BillDetail> getBillDetails() {
        return billDetails;
    }

    public void setBillDetails(List<BillDetail> billDetails) {
        this.billDetails = billDetails;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getTableNo() {
        return tableNo;
    }

    public void setTableNo(int tableNo) {
        this.tableNo = tableNo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
        if(createTime != null){
            this.createTimeStr = new SimpleDateFormat("yyyy-MM-dd H:m:s").format(createTime);
        }
    }
}
