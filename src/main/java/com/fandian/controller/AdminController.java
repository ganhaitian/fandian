package com.fandian.controller;

import com.fandian.dao.BillDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;

/**
 * Created by gan on 14-7-22.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Inject
    private BillDao billDao;

    @RequestMapping("/cashier")
    public String getCashierView(Model model){
        model.addAttribute("bills",billDao.getAllBills());
        return "admin/cashier";
    }

    @RequestMapping("/menu")
    public String getMenuView(){
        return "admin/menu";
    }

}
