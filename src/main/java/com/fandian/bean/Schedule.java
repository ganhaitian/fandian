package com.fandian.bean;

import org.springframework.util.StringUtils;

/**
 * Created by gan on 14-8-20.
 */
public class Schedule {

    private int id;

    private String customerName;

    private String bookDate;

    private String area;

    private int tables;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getTables() {
        return tables;
    }

    public void setTables(int tables) {
        this.tables = tables;
    }

    private String tableNo;

    private String phoneNum;

    private int mealsNum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getBookDate() {
        return bookDate;
    }

    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }

    public String getTableNo() {
        if(!StringUtils.isEmpty(this.tableNo))
            return this.tableNo;
        else{
            if(this.area.equals("V")){
                return area + tables;
            }else{
                return String.valueOf(Integer.parseInt(this.area) * 100 + tables);
            }
        }
    }

    public void setTableNo(String tableNo) {
        this.tableNo = tableNo;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getMealsNum() {
        return mealsNum;
    }

    public void setMealsNum(int mealsNum) {
        this.mealsNum = mealsNum;
    }
}
