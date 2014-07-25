package com.fandian.controller;

import com.fandian.dao.BillDao;
import com.fandian.dao.MenuDao;
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

    @Inject
    private MenuDao menuDao;

    /**
     * 后台的主页面默认跳转到收银台的页面
     * @param model
     * @return
     */
    @RequestMapping(value = {"/cashier","/main"})
    public String getCashierView(Model model){
        model.addAttribute("bills",billDao.getAllBills());
        return "admin/cashier";
    }

    @RequestMapping("/menu")
    public String getMenuView(Model model){
        model.addAttribute("categories", menuDao.getDishCategories());
        return "admin/menu";
    }

    @RequestMapping("/user")
    public String getUserView(){
        return "admin/user";
    }

}
