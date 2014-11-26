package com.fandian.controller;

import com.fandian.bean.BillDetail;
import com.fandian.bean.Dish;
import com.fandian.bean.Taste;
import com.fandian.bean.Weight;
import com.fandian.dao.MenuDao;
import com.fandian.model.DishOrderInfo;
import com.fandian.util.JSONUtil;
import com.fandian.util.SessionUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by zhijieliu on 2014/11/11.
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    //根据桌号，缓存菜单
    public static final Map<String,List<DishOrderInfo>> DISH_ORDER_CACHE = new ConcurrentHashMap<String, List<DishOrderInfo>>();

    private Logger logger = LoggerFactory.getLogger(getClass());
    @Resource
    private JSONUtil jsonUtil;

    @Resource
    private MenuDao menuDao;

    @Resource
    private SessionUtil sessionUtil;
    /**
     * 加菜
     * @return
     */
    @RequestMapping("/dishadd")
    @ResponseBody
    public String addDish(BillDetail billDetail, HttpServletRequest request){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String deskno = sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY,request,String.class);

            if (!DISH_ORDER_CACHE.containsKey(deskno)){
                DISH_ORDER_CACHE.put(deskno,new ArrayList<DishOrderInfo>());
            }
            boolean hasDishInfo = false;
            //同dishid的已点数量
            float existNumber = 0;
            for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)){
                if (dishOrderInfo.getDish().getId() == billDetail.getDishId() &&
                        dishOrderInfo.getTaste().getId() == billDetail.getTaste() &&
                        dishOrderInfo.getWeight().getId() == billDetail.getWeight()){
                    hasDishInfo = true;
                    dishOrderInfo.setNumber(dishOrderInfo.getNumber()+billDetail.getAmount());
                }
                if (dishOrderInfo.getDish().getId() == billDetail.getDishId()){
                    existNumber = dishOrderInfo.getTotalNumber();
                    dishOrderInfo.setTotalNumber(dishOrderInfo.getTotalNumber() + billDetail.getAmount());
                }
            }
            if (!hasDishInfo){
                Dish dish = menuDao.getDish(billDetail.getDishId());
                Taste taste = menuDao.getTaste(billDetail.getTaste());
                Weight weight = menuDao.getWeight(billDetail.getWeight());
                DishOrderInfo tmpOrderInfo = new DishOrderInfo(dish,taste,weight,billDetail.getAmount());
                tmpOrderInfo.setTotalNumber(tmpOrderInfo.getTotalNumber() + existNumber);
                DISH_ORDER_CACHE.get(deskno).add(tmpOrderInfo);

            }

        } catch (Exception e) {
            logger.error("添加菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);

    }

    /**
     * 减少菜量
     * @return
     */
    @RequestMapping("/dishreduce")
    @ResponseBody
    public String reduceDish(BillDetail billDetail, HttpServletRequest request){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String deskno = sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY, request, String.class);
            if (DISH_ORDER_CACHE.containsKey(deskno)){
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)){
                    if (dishOrderInfo.getDish().getId() == billDetail.getDishId() &&
                            dishOrderInfo.getTaste().getId() == billDetail.getTaste() &&
                            dishOrderInfo.getWeight().getId() == billDetail.getWeight() &&
                            dishOrderInfo.getNumber()>0){

                        dishOrderInfo.setNumber(dishOrderInfo.getNumber()-1);
                        if (dishOrderInfo.getNumber() == 0){
                            DISH_ORDER_CACHE.get(deskno).remove(dishOrderInfo);
                        }
                        break;
                    }

                }
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)){
                    if (dishOrderInfo.getDish().getId() == billDetail.getDishId()){

                        dishOrderInfo.setTotalNumber(dishOrderInfo.getTotalNumber()-1);


                    }

                }
            }

        } catch (Exception e) {
            logger.error("删除菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    /**
     * 删除菜品
     * @param billDetail
     * @return
     */
    @RequestMapping("/dishremove")
    @ResponseBody
    public String removeDish(BillDetail billDetail, HttpServletRequest request){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String deskno = sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY, request, String.class);
            if (DISH_ORDER_CACHE.containsKey(deskno)){
                //同dishid的已点数量
                float existNumber = 0;
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)){
                    if (dishOrderInfo.getDish().getId() == billDetail.getDishId() &&
                            dishOrderInfo.getTaste().getId() == billDetail.getTaste() &&
                            dishOrderInfo.getWeight().getId() == billDetail.getWeight()){
                        existNumber = dishOrderInfo.getNumber();
                        DISH_ORDER_CACHE.get(deskno).remove(dishOrderInfo);
                        break;
                    }
                }
                for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)){
                    if (dishOrderInfo.getDish().getId() == billDetail.getDishId()){
                        dishOrderInfo.setTotalNumber(dishOrderInfo.getTotalNumber()-existNumber);
                    }
                }

            }

        } catch (Exception e) {
            logger.error("删除菜品信息至桌单缓存失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/details")
    @ResponseBody
    public String getDetails(HttpServletRequest request){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("success",true);
        try {
            String deskno = sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY, request, String.class);
            if (DISH_ORDER_CACHE.containsKey(deskno)){
                result.put("dishes",DISH_ORDER_CACHE.get(deskno));
            }

        } catch (Exception e) {
            logger.error("从桌单缓存获取用户点菜信息失败", e);
            result.put("success",false);
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/list")
    public String toListPage(Model model, HttpServletRequest request){
        String deskno = sessionUtil.fetchObjectFromSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY, request, String.class);

        if (!DISH_ORDER_CACHE.containsKey(deskno)){
            DISH_ORDER_CACHE.put(deskno,new ArrayList<DishOrderInfo>());
        }

        model.addAttribute("tableNo", deskno.substring(1));
        model.addAttribute("areaNo", deskno.substring(0,1));
        int sumfee = 0;
        model.addAttribute("list", DISH_ORDER_CACHE.get(deskno));

        for (DishOrderInfo dishOrderInfo : DISH_ORDER_CACHE.get(deskno)) {
            if (dishOrderInfo.getWeight() != null && dishOrderInfo.getWeight().getPrice_relate()) {
                sumfee += dishOrderInfo.getNumber() * dishOrderInfo.getDish().getPrice()
                        * dishOrderInfo.getWeight().getPrice_ratio();
            } else
                sumfee += dishOrderInfo.getNumber() * dishOrderInfo.getDish().getPrice();
        }

        model.addAttribute("sumfee", sumfee);
        return "cart/list";
    }
}
