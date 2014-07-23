package com.fandian.controller;

import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import com.fandian.bean.DishCustomerView;
import com.fandian.bean.DishListOfCustomerView;
import com.fandian.dao.MenuDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String getCustomerViewTop(Model model){
        List<DishCategory> categories = menuDao.getDishCategories();
        List<DishListOfCustomerView> viewList = new ArrayList<DishListOfCustomerView>();
        for (DishCategory category : categories){
            DishListOfCustomerView viewItem = new DishListOfCustomerView();
            viewItem.setInfo(new ArrayList<DishCustomerView>());
            viewItem.setTypeid("type" + category.getId());
            viewItem.setHref("#type" + category.getId());
            viewItem.setName(category.getName());
            for(Dish dish : menuDao.getDishesInCategory(category.getId())){
                DishCustomerView dishTmp = new DishCustomerView();
                dishTmp.setId(dish.getId());
                dishTmp.setName(dish.getName());
                dishTmp.setDetail(dish.getDetail());
                dishTmp.setPrice(dish.getPrice());
                dishTmp.setSales(dish.getSales());
                dishTmp.setImg_url("/resources/img/holder.jpg");
                dishTmp.setStar_info_id("dish"+dish.getId());
                dishTmp.setSub_number_id("dishsubnum"+dish.getId());
                viewItem.getInfo().add(dishTmp);
            }

            viewList.add(viewItem);
        }

        model.addAttribute("typedata",jsonUtil.transToJsonStrByGson(viewList));

        return "menu/customer-view-1";
    }
}
