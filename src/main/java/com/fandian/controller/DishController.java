package com.fandian.controller;

import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import com.fandian.dao.MenuDao;
import com.fandian.util.JSONUtil;
import com.fandian.util.SessionUtil;
import com.fandian.util.UserTypeJudger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.krb5.internal.crypto.Des;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zhijieliu on 2014/11/10.
 */
@Controller
@RequestMapping("/dish")
public class DishController {
    @Inject
    private MenuDao menuDao;

    @Inject
    private JSONUtil jsonUtil;

    @Inject
    private SessionUtil sessionUtil;

    private String list_page_name_order = "dish/order-category-list";
    private String list_page_name_normal = "dish/category-list";

    @RequestMapping("/category")
    public String toDishListByCategory(Model model,HttpServletRequest request){
        List<DishCategory> rootCategories = menuDao.getRootDishCategories();
        model.addAttribute("categories", rootCategories);

        if (sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCHEDULE_EXIST_KEY,request,Boolean.class) != null &&
                sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCHEDULE_EXIST_KEY,request,Boolean.class) == true){
            return list_page_name_order;
        }
        return list_page_name_normal;
    }

    @RequestMapping("/category/{categoryId}")
    public String toDishListByCategory(Model model, @PathVariable int categoryId) {
        List<DishCategory> rootCategories = menuDao.getChildDishCategories(categoryId);
        if (rootCategories.size() == 0) {
            List<Dish> dishes = menuDao.getDishesInCategory(categoryId);
            model.addAttribute("dishes", dishes);
        }
        model.addAttribute("rootcategory", menuDao.getDishCategory(categoryId));
        model.addAttribute("categories", rootCategories);
        model.addAttribute("rootCategories", menuDao.getRootDishCategories());

        return list_page_name_normal;
    }

    @RequestMapping("/order/category/{categoryId}")
    public String toOrderDishListByCategory(Model model, @PathVariable int categoryId){
        toDishListByCategory(model,categoryId);
        return list_page_name_order;
    }

    @RequestMapping("/meta/{dishId}")
    @ResponseBody
    public String getDishMetaDetails(@PathVariable int dishId) {

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("taste",menuDao.getDishTastes(dishId));
        result.put("weight",menuDao.getDishWeights(dishId));
        return jsonUtil.transToJsonStrByGson(result);
    }
}
