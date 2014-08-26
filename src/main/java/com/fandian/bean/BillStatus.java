package com.fandian.bean;

/**
 * Created by gan on 14-7-23.
 */
public enum BillStatus {

    COMMON(0),//普通
    SETTLED(1),//已结付
    LOSSES(2),//已挂账
    PRINTED(3);//已打印

    private int status;

    private BillStatus(int status){
        this.status = status;
    }

    public int value(){
        return this.status;
    }

}
