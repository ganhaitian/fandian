package com.fandian.bean;

/**
 * Created by gan on 14-8-20.
 */
public class Schedule {

    private int id;

    private String customerName;

    private String bookDate;

    private int area;

    private int tables;

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getTables() {
        return tables;
    }

    public void setTables(int tables) {
        this.tables = tables;
    }

    private int tableNo;

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

    public int getTableNo() {
        if(this.tableNo > 0)
            return this.tableNo;
        else
            return area * 100 + tables;
    }

    public void setTableNo(int tableNo) {
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
