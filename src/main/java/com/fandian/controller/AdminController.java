package com.fandian.controller;

import com.fandian.dao.BillDao;
import com.fandian.dao.CustomerDao;
import com.fandian.dao.MenuDao;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by gan on 14-7-22.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Inject
    private CustomerDao customerDao;

    @Inject
    private MenuDao menuDao;

    /**
     * 后台的主页面默认跳转到收银台的页面
     * @param model
     * @return
     */
    @Secured("ROLE_MANAGER")
    @RequestMapping(value = {"/cashier","/main"})
    public String getCashierView(Model model){
        //model.addAttribute("bills",billDao.getAllBills());
        model.addAttribute("customers",customerDao.getAllCustomers());
        return "admin/cashier";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping("/menu")
    public String getMenuView(Model model){
        model.addAttribute("categories", menuDao.getDishCategories());
        model.addAttribute("units", menuDao.getAllUnits());
        model.addAttribute("tastes",menuDao.getAllTastes());

        //生成
        List<Map<String,Object>> weights = menuDao.getAllWeights();
        for(Map<String,Object> weight:weights){
            String name = weight.get("code").toString() + "(";
            for(String subweight:menuDao.getSubWeight(weight.get("code").toString())){
                name += subweight + ",";
            }
            name += ")";
            weight.put("name",name);
        }
        model.addAttribute("weights",weights);

        return "admin/menu";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping("/user")
    public String getUserView(){
        return "admin/user";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping("/book")
    public String getBookView(){
        return "admin/book";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping("/bcustomer")
    public String getBCustomerView(){
        return "admin/bcustomer";
    }

}
