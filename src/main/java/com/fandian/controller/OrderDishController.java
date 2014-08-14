package com.fandian.controller;

import com.fandian.bean.BillDetail;
import com.fandian.bean.Dish;
import com.fandian.bean.Taste;
import com.fandian.bean.Weight;
import com.fandian.dao.MenuDao;
import com.fandian.model.DishListOfCustomerView;
import com.fandian.model.DishOrderInfo;
import com.fandian.util.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by zhijieliu on 2014/7/25.
 * 点菜控制
 */
@Controller
@RequestMapping("/order")
public class OrderDishController {
    //根据用户名，缓存菜单
    public static final Map<String,List<DishOrderInfo>> DISH_ORDER_CACHE = new ConcurrentHashMap<String, List<DishOrderInfo>>();
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Resource
    private JSONUtil jsonUtil;

    @Resource
    private MenuDao menuDao;

    @RequestMapping("/customer/addDish")
    @ResponseBody
    public String addDish(BillDetail billDetail){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            if (!DISH_ORDER_CACHE.containsKey(username)){
                DISH_ORDER_CACHE.put(username,new ArrayList<DishOrderInfo>());
            }
            boolean hasDishInfo = false;
            for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(username)){
                if (dishOrderInfo.getDish().getId() == billDetail.getDishId() &&
                        dishOrderInfo.getTaste().getId() == billDetail.getTaste() &&
                        dishOrderInfo.getWeight().getId() == billDetail.getWeight()){
                    hasDishInfo = true;
                    dishOrderInfo.setNumber(dishOrderInfo.getNumber()+billDetail.getAmount());
                }
            }
            if (!hasDishInfo){
                Dish dish = menuDao.getDish(billDetail.getDishId());
                Taste taste = menuDao.getTaste(billDetail.getTaste());
                Weight weight = menuDao.getWeight(billDetail.getWeight());
                DISH_ORDER_CACHE.get(username).add(new DishOrderInfo(dish,taste,weight,billDetail.getAmount()));
            }
        } catch (Exception e) {
            logger.error("添加菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/customer/delDish")
    @ResponseBody
    public String delDish(Dish dish){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            if (DISH_ORDER_CACHE.containsKey(username)){
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(username)){
                    if (dishOrderInfo.getDish().getId() == dish.getId() && dishOrderInfo.getNumber()>0){

                        dishOrderInfo.setNumber(dishOrderInfo.getNumber()-1);
                        if (dishOrderInfo.getNumber() == 0){
                            DISH_ORDER_CACHE.get(username).remove(dishOrderInfo);
                        }
                        break;
                    }

                }
            }

        } catch (Exception e) {
            logger.error("删除菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/customer/removeDish")
    @ResponseBody
    public String removeDish(Dish dish){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            if (DISH_ORDER_CACHE.containsKey(username)){
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(username)){
                    if (dishOrderInfo.getDish().getId() == dish.getId()){
                        DISH_ORDER_CACHE.get(username).remove(dishOrderInfo);
                        break;
                    }
                }
            }

        } catch (Exception e) {
            logger.error("删除菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/customer/getDishes")
    @ResponseBody
    public String getAllOrderDishes(){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            if (DISH_ORDER_CACHE.containsKey(username)){
                result.put("dishes",DISH_ORDER_CACHE.get(username));
            }

        } catch (Exception e) {
            logger.error("从桌单缓存获取用户点菜信息失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }
}
