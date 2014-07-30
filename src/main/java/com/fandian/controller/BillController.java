package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.BillDetail;
import com.fandian.bean.BillStatus;
import com.fandian.dao.BillDao;
import com.fandian.model.DishOrderInfo;
import com.fandian.util.JSONUtil;
import com.google.gson.reflect.TypeToken;
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

    @Resource
    private JSONUtil jsonUtil;

    @Inject
    private BillDao billDao;

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
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            //查看该用户是否已经存在订单
            Bill existedBill = billDao.getCommonBillByUsername(username);
            //存在未结付的订单时
            if (existedBill != null) {
                model.addAttribute("existedBill", true);
                model.addAttribute("tableNo", existedBill.getTableNo());
            } else {
                model.addAttribute("existedBill", false);
            }

            if (OrderDishController.DISH_ORDER_CACHE.containsKey(username)) {
                int sumfee = 0;
                model.addAttribute("list", OrderDishController.DISH_ORDER_CACHE.get(username));

                for (DishOrderInfo dishOrderInfo : OrderDishController.DISH_ORDER_CACHE.get(username)) {
                    sumfee += dishOrderInfo.getNumber() * dishOrderInfo.getDish().getPrice();
                }

                model.addAttribute("sumfee", sumfee);
            }
        } catch (Exception e) {

        }

        return "bill/bill-view";
    }


}
