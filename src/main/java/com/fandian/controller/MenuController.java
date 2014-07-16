package com.fandian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by gan on 14-7-15.
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @RequestMapping("/getQuickView")
    public String getQuickView(){
        return "menu/quick-view";
    }

    @RequestMapping("/customer/side")
    public String getCustomerView(){
        return "menu/customer-view";
    }

    @RequestMapping("/customer/top")
    public String getCustomerViewTop(){
        return "menu/customer-view_1";
    }
}
