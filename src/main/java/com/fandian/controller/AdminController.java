package com.fandian.controller;

import com.fandian.bean.DishCategory;
import com.fandian.dao.BillDao;
import com.fandian.dao.MenuDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;

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

    @RequestMapping("/cashier")
    public String getCashierView(Model model){
        model.addAttribute("bills",billDao.getAllBills());
        return "admin/cashier";
    }

    @RequestMapping("/menu")
    public String getMenuView(Model model){
        List<DishCategory> rootCategories = menuDao.getDishCategories(0);
        for(DishCategory rootCategory:rootCategories){
            rootCategory.setChildCategories(menuDao.getDishCategories(rootCategory.getId()));
        }
        model.addAttribute("categories",rootCategories);
        return "admin/menu";
    }

}
