package com.fandian.controller;

import com.fandian.bean.*;
import com.fandian.dao.BillDao;
import com.fandian.dao.CustomerDao;
import com.fandian.model.DishOrderInfo;
import com.fandian.util.JSONUtil;
import com.fandian.util.UserTypeJudger;
import com.google.gson.reflect.TypeToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by gan on 14-7-15.
 */
@Controller
@RequestMapping("/bill")
public class BillController {

    private Logger log = LoggerFactory.getLogger(getClass());

    @Resource
    private JSONUtil jsonUtil;

    @Inject
    private BillDao billDao;

    @Inject
    private CustomerDao customerDao;

    @RequestMapping("/new")
    public String toNewBillView() {
        return "menu/customer-view-1";
    }

    @Secured("ROLE_MANAGER")
    @RequestMapping("/checkout")
    @ResponseBody
    public String checkoutBill(@RequestParam int billId, @RequestParam float discount, @RequestParam int paymentType) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<String, Object> result = new HashMap<String, Object>();

        Bill bill = billDao.getBillById(billId);
        if (bill == null || bill.getStatus() != BillStatus.COMMON.value()) {
            result.put("success", false);
            result.put("errMsg", "账单不存在，或者账单状态错误!");
            return jsonUtil.transToJsonStrByGson(result);
        }

        //折扣值异常
        if (discount > bill.getFee()) {
            result.put("success", false);
            result.put("errMsg", "折扣金额错误!");
            return jsonUtil.transToJsonStrByGson(result);
        }

        //更新账单结账状态
        float actualFee = bill.getFee() - discount;
        billDao.updateCheckoutInfo(billId, BillStatus.SETTLED.value(), discount, actualFee, paymentType,username);
        return "{\"success\":true}";
    }

    @RequestMapping("/losses")
    @ResponseBody
    public String lossesBill(@RequestParam int billId,@RequestParam int customerId){
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Map<String, Object> result = new HashMap<String, Object>();

        Customer customer = customerDao.getCustomerById(customerId);
        Bill bill = billDao.getBillById(billId);
        if(customer != null){
            billDao.updateBillLossesInfo(billId,customerId,customer.getName(),username);
            customerDao.updateCustomerFee(customerId,bill.getFee());
            result.put("success",true);
        }else{
            result.put("success",false);
            result.put("errMsg","客户不存在!");
        }

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/getBillDetails")
    @ResponseBody
    public String getBillDetails(@RequestParam int billId) {
        List<BillDetail> billDetails = billDao.getBillDetails(billId);
        return jsonUtil.transToJsonStrByGson(billDetails);
    }

    @RequestMapping("/getAllBills")
    @ResponseBody
    public String getAllBills(){
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("data",billDao.getAllBills());
        return jsonUtil.transToJsonStrByGson(result);
    }
    @Secured(value={"ROLE_WAITOR","ROLE_MANAGER"})
    @RequestMapping("/desk/active")
    public String getActiveDesk(Model model){
        try {
            model.addAttribute("bills", billDao.getActiveBills());
        } catch (Exception e) {
            log.error("查询桌单异常",e);
        }
        return "bill/bill-desk-list";
    }

    @Secured(value={"ROLE_WAITOR","ROLE_MANAGER"})
    @RequestMapping("/desk/active/{billId}")
    public String getActiveDesk(Model model,@PathVariable int billId){
        try {
            model.addAttribute("bills", billDao.getActiveBills());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "bill/bill-desk-list";
    }

    @RequestMapping(value = "/confirm", method = {RequestMethod.POST})
    @ResponseBody
    public String confirmBill(@RequestParam String param, @RequestParam int tableNo) {
        //关联上用户名
        String username = SecurityContextHolder.getContext().getAuthentication().getName();

        List<BillDetail> billDetails = jsonUtil.transJsonToBeanListByGson(param, new TypeToken<List<BillDetail>>() {
        }.getType());

        Bill newBill = new Bill();
        newBill.setTableNo(tableNo);
        newBill.setUserName(username);

        for (BillDetail billDetail : billDetails) {
            newBill.setFee(newBill.getFee() + billDetail.getPrice() * billDetail.getAmount());
        }
        newBill.setBillDetails(billDetails);

        billDao.saveNewBill(newBill);
        return "{\"success\":true}";
    }

    @RequestMapping("/view")
    public String getQuickView(Model model, HttpServletRequest request) {
        try {
            String username = null;
            Bill existedBill = null;
            if (UserTypeJudger.isCustomer(SecurityContextHolder.getContext().getAuthentication())){
                username = SecurityContextHolder.getContext().getAuthentication().getName();
                existedBill = billDao.getCommonBillByUsername(username);
                model.addAttribute("isCustomer",true);

            }else{
                existedBill = billDao.getBillByTableNo((Integer.parseInt(request.getParameter("tableNo"))));
                model.addAttribute("isCustomer",false);
            }

            List<BillDetail> savedBillDetails = null;
            //存在未结付的订单时
            if (existedBill != null) {
                model.addAttribute("existedBill", true);
                model.addAttribute("tableNo", existedBill.getTableNo());
                savedBillDetails = billDao.getBillDetails(existedBill.getId());
                username = existedBill.getUserName();

            } else {
                model.addAttribute("existedBill", false);
            }



            if (!OrderDishController.DISH_ORDER_CACHE.containsKey(username)) {
                OrderDishController.DISH_ORDER_CACHE.put(username,new ArrayList<DishOrderInfo>());
            }

            boolean hasDiff = mergeDBAndCacheDishInfo(OrderDishController.DISH_ORDER_CACHE.get(username), savedBillDetails);

            model.addAttribute("hasDiff",hasDiff);

            int sumfee = 0;
            model.addAttribute("list", OrderDishController.DISH_ORDER_CACHE.get(username));

            for (DishOrderInfo dishOrderInfo : OrderDishController.DISH_ORDER_CACHE.get(username)) {
                sumfee += dishOrderInfo.getNumber() * dishOrderInfo.getDish().getPrice();
            }

            model.addAttribute("sumfee", sumfee);

        } catch (Exception e) {
            log.error("获取桌单异常",e);
        }

        return "bill/bill-view";
    }

    /**
     * 合并cache与数据库的订单信息
     * 核对cache中的菜品数量与已保存桌单中数量
     * 如果cache中的数量大，则该桌单已被修改
     * 页面需进行提示，并显示提交按钮
     * @param cacheDishOrderInfos 缓存中的菜品订购信息
     * @param savedBillDetails 数据库中保存的菜品订购信息
     * @return 是否存在差异
     */
    private boolean mergeDBAndCacheDishInfo(List<DishOrderInfo> cacheDishOrderInfos, List<BillDetail> savedBillDetails){
        boolean hasDiff = false;
        if (savedBillDetails == null){
            return true;
        }
        for (BillDetail billDetail : savedBillDetails){

            boolean existInCache = false;
            for (DishOrderInfo dishOrderInfo : cacheDishOrderInfos){
                if (billDetail.getDishId() == dishOrderInfo.getDish().getId()){
                    existInCache = true;
                    if (billDetail.getAmount() != dishOrderInfo.getNumber()){
                        hasDiff = true;
                    }
                }
            }
            if (!existInCache){
                DishOrderInfo tmp = new DishOrderInfo();
                tmp.setNumber(billDetail.getAmount());
                Dish dish = new Dish();
                dish.setId(billDetail.getDishId());
                dish.setName(billDetail.getDishName());
                dish.setPrice(billDetail.getPrice()/billDetail.getAmount());
                tmp.setDish(dish);
                cacheDishOrderInfos.add(tmp);
            }
        }
        if (cacheDishOrderInfos.size() != savedBillDetails.size()){
            hasDiff = true;
        }
        return hasDiff;
    }
}
