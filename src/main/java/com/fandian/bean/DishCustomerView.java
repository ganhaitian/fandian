package com.fandian.bean;

/**
 * Created by zhijieliu on 2014/7/21.
 */
public class DishCustomerView extends Dish {
    private String img_url;
    //购买数量
    private String sub_number_id;
    //评星显示ID
    private String star_info_id;

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getSub_number_id() {
        return sub_number_id;
    }

    public void setSub_number_id(String sub_number_id) {
        this.sub_number_id = sub_number_id;
    }

    public String getStar_info_id() {
        return star_info_id;
    }

    public void setStar_info_id(String star_info_id) {
        this.star_info_id = star_info_id;
    }
}
