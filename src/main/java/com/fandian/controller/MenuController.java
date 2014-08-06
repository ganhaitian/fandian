package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.BillStatus;
import com.fandian.bean.Dish;
import com.fandian.bean.DishCategory;
import com.fandian.dao.BillDao;
import com.fandian.dao.MenuDao;
import com.fandian.model.DishCustomerView;
import com.fandian.model.DishListOfCustomerView;
import com.fandian.util.JSONUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
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
    public String getQuickView(Model model) {
        model.addAttribute("categories", menuDao.getDishCategories());
        return "menu/quick-view";
    }

    @RequestMapping(value = "/getDishInCategory")
    public
    @ResponseBody
    String getDishInCategory(@RequestParam int categoryId) {
        return jsonUtil.transToJsonStrByGson(menuDao.getDishesInCategory(categoryId));
    }

    /**
     * 获得给DataTable格式用的数据菜单数据
     *
     * @param categoryId
     * @return
     */
    @RequestMapping(value = "/getDishInCategoryByDtFormat")
    public
    @ResponseBody
    String getDishInCategoryByDtFormat(@RequestParam int categoryId) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("data", menuDao.getDishesInCategory(categoryId));
        return jsonUtil.transToJsonStrByGson(result);
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value = "updateDish")
    public
    @ResponseBody
    String updateDish(@ModelAttribute Dish dish,@RequestParam int picEdited,
        @RequestParam(value = "pic", required = false) CommonsMultipartFile file) {

        int dishId = dish.getId();
        if (dishId != 0) {
            menuDao.updateDish(dish);
        } else{
            dishId = menuDao.insertDish(dish);
        }

        //如果图片有修改过，不过是新增还是修改已有的
        if(picEdited == 1 && file != null){
            String fileName = dishId + ".jpg";
            try{
                String webPath = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
                FileUtils.copyInputStreamToFile(file.getFileItem().getInputStream(),
                    new File(webPath+"/resources/img/dish"+fileName));
            }catch(Exception e){
                e.printStackTrace();
                return "{\"success\":false}";
            }
        }

        return "{\"success\":true,\"dishId\":" + dishId + "}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value = "updateCategory")
    public
    @ResponseBody
    String updateCategory(@RequestParam String param) {
        DishCategory dishCategory = jsonUtil.transJsonToBeanByGson(param, DishCategory.class);
        int categoryId = dishCategory.getId();
        if (categoryId != 0) {
            menuDao.updateDishCategory(dishCategory);
        } else {
            menuDao.insertDishCategory(dishCategory);
        }
        return "{\"success\":true}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value = "delCategory")
    public
    @ResponseBody
    String delCategory(@RequestParam int categoryId) {
        menuDao.delDishCategory(categoryId);
        return "{\"success\":true}";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping(value = "delDish")
    public
    @ResponseBody
    String delDish(@RequestParam int dishId) {
        menuDao.deleteDish(dishId);
        return "{\"success\":true}";
    }

    @RequestMapping(value = "searchDish")
    public
    @ResponseBody
    String searchDish(@RequestParam String keyWord) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            result.put("dishes", menuDao.searchDish(keyWord));
            result.put("success", true);
            return jsonUtil.transToJsonStrByGson(result);
        } catch (Exception e) {
            return "{\"success\":false}";
        }
    }

    @RequestMapping("/customer/category")
    public String getCustomerMenuView(Model model, HttpServletRequest request) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //查看该用户是否已经存在订单
        Bill existedBill = billDao.getCommonBillByUsername(username);

        //查看是否为改单需求，跳转过来的
        String editing = request.getParameter("editing");

        //存在订单的话，并且非改单需求，直接跳入到订单查看的页面
        if (existedBill != null && existedBill.getStatus() == BillStatus.COMMON.value() &&
            (editing == null || editing.equals("0"))) {
            return "redirect:/bill/view";
        }

        List<DishCategory> rootCategories = menuDao.getRootDishCategories();
        model.addAttribute("categories", rootCategories);
        return "menu/customer-category";
    }

    @RequestMapping("/customer/category/{categoryId}")
    public String getCustomerMenuSubView(Model model, @PathVariable int categoryId) {
        List<DishCategory> rootCategories = menuDao.getChildDishCategories(categoryId);
        if (rootCategories.size() == 0) {
            List<Dish> dishes = menuDao.getDishesInCategory(categoryId);
            model.addAttribute("dishes", dishes);
        }
        model.addAttribute("rootcategory", menuDao.getDishCategory(categoryId));
        model.addAttribute("categories", rootCategories);
        model.addAttribute("rootCategories", menuDao.getRootDishCategories());
        return "menu/customer-category";
    }

    @RequestMapping("/customer/side")
    public String getCustomerView() {
        return "menu/customer-view";
    }

    @RequestMapping("/customer/top")
    public String getCustomerViewTop(Model model) {
        List<DishCategory> categories = menuDao.getDishCategories();
        List<DishListOfCustomerView> viewList = new ArrayList<DishListOfCustomerView>();
        for (DishCategory category : categories) {
            DishListOfCustomerView viewItem = new DishListOfCustomerView();
            viewItem.setInfo(new ArrayList<DishCustomerView>());
            viewItem.setTypeid("type" + category.getId());
            viewItem.setHref("#type" + category.getId());
            viewItem.setName(category.getName());
            for (Dish dish : menuDao.getDishesInCategory(category.getId())) {
                DishCustomerView dishTmp = new DishCustomerView();
                dishTmp.setId(dish.getId());
                dishTmp.setName(dish.getName());
                dishTmp.setDetail(dish.getDetail());
                dishTmp.setPrice(dish.getPrice());
                dishTmp.setSales(dish.getSales());
                dishTmp.setImg_url("/resources/img/holder.jpg");
                dishTmp.setStar_info_id("dish" + dish.getId());
                dishTmp.setSub_number_id("dishsubnum" + dish.getId());
                viewItem.getInfo().add(dishTmp);
            }

            viewList.add(viewItem);
        }

        model.addAttribute("typedata", jsonUtil.transToJsonStrByGson(viewList));

        return "menu/customer-view-1";
    }
}
