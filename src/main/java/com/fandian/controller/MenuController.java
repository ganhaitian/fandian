package com.fandian.controller;

import com.fandian.bean.Dish;
import com.fandian.dao.MenuDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by gan on 14-7-15.
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Inject
    private MenuDao menuDao;

    private JSONUtil jsonUtil = new JSONUtil();

    @RequestMapping("/getQuickView")
    public String getQuickView(Model model){
        model.addAttribute("categories",menuDao.getDishCategories());
        return "menu/quick-view";
    }

    @RequestMapping(value="/getDishInCategory")
    public @ResponseBody String getDishInCategory(@RequestParam int categoryId){
        return jsonUtil.transToJsonStrByGson(menuDao.getDishesInCategory(categoryId));
    }

    @RequestMapping("/customer/side")
    public String getCustomerView(){
        return "menu/customer-view";
    }

    @RequestMapping("/customer/top")
    public String getCustomerViewTop(){
        return "menu/customer-view-1";
    }
}
