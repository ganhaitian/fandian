package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.BillStatus;
import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import com.fandian.dao.BillDao;
import com.fandian.model.DishCustomerView;
import com.fandian.model.DishListOfCustomerView;
import com.fandian.dao.MenuDao;
import com.fandian.model.DishOrderInfo;
import com.fandian.util.JSONUtil;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
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

    @Inject
    private BillDao billDao;

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

    /**
     * 获得给DataTable格式用的数据菜单数据
     * @param categoryId
     * @return
     */
    @RequestMapping(value="/getDishInCategoryByDtFormat")
    public @ResponseBody String getDishInCategoryByDtFormat(@RequestParam int categoryId){
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("data",menuDao.getDishesInCategory(categoryId));
        return jsonUtil.transToJsonStrByGson(result);
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value="updateDish")
    public @ResponseBody String updateDish(@RequestParam String param){
        Dish dish = jsonUtil.transJsonToBeanByGson(param,Dish.class);
        int dishId = dish.getId();
        if(dishId != 0){
            menuDao.updateDish(dish);
        }else
            dishId = menuDao.insertDish(dish);
        return "{\"success\":true,\"dishId\":"+dishId+"}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value="updateCategory")
    public @ResponseBody String updateCategory(@RequestParam String param){
        DishCategory dishCategory = jsonUtil.transJsonToBeanByGson(param,DishCategory.class);
        int categoryId = dishCategory.getId();
        if(categoryId != 0){
            menuDao.updateDishCategory(dishCategory);
        }else{
            menuDao.insertDishCategory(dishCategory);
        }
        return "{\"success\":true}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value="delCategory")
    public @ResponseBody String delCategory(@RequestParam int categoryId){
        menuDao.delDishCategory(categoryId);
        return "{\"success\":true}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value="delDish")
    public @ResponseBody String delDish(@RequestParam int dishId){
        menuDao.deleteDish(dishId);
        return "{\"success\":true}";
    }

    @RequestMapping("/customer/category")
    public String getCustomerMenuView(Model model){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //查看该用户是否已经存在订单
        Bill existedBill = billDao.getCommonBillByUsername(username);

        //存在订单的话，直接跳入到订单查看的页面
        if(existedBill != null && existedBill.getStatus() == BillStatus.COMMON.value() &&
            OrderDishController.DISH_ORDER_CACHE.containsKey(username)){
            return "redirect:/bill/view";
        }

        List<DishCategory> rootCategories = menuDao.getRootDishCategories();
        model.addAttribute("categories",rootCategories);
        return "menu/customer-category";
    }

    @RequestMapping("/customer/category/{categoryId}")
    public String getCustomerMenuSubView(Model model, @PathVariable int categoryId){
        List<DishCategory> rootCategories = menuDao.getChildDishCategories(categoryId);
        if (rootCategories.size() == 0){
            List<Dish> dishes = menuDao.getDishesInCategory(categoryId);
            model.addAttribute("dishes",dishes);
        }
        model.addAttribute("rootcategory",menuDao.getDishCategory(categoryId));
        model.addAttribute("categories",rootCategories);
        model.addAttribute("rootCategories",menuDao.getRootDishCategories());
        return "menu/customer-category";
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
