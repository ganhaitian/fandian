package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.BillDetail;
import com.fandian.bean.BillStatus;
import com.fandian.dao.BillDao;
import com.fandian.util.JSONUtil;
import com.google.gson.reflect.TypeToken;
import org.springframework.security.access.annotation.Secured;
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
    public String checkoutBill(@RequestParam int billId) {
        billDao.updateStatus(billId, BillStatus.SETTLED.value());
        return "{\"success\":true}";
    }

    @RequestMapping("/getBillDetails")
    @ResponseBody
    public String getBillDetails(@RequestParam int billId){
        List<BillDetail> billDetails = billDao.getBillDetails(billId);
        return jsonUtil.transToJsonStrByGson(billDetails);
    }


    @RequestMapping(value = "/confirm", method = {RequestMethod.POST})
    public String confirmBill(@RequestParam String param,@RequestParam int tableNo) {
        List<BillDetail> billDetails = jsonUtil.transJsonToBeanListByGson(param, new TypeToken<List<BillDetail>>() {
        }.getType());

        Bill newBill = new Bill();
        newBill.setTableNo(tableNo);

        for(BillDetail billDetail:billDetails){
            newBill.setFee(newBill.getFee() + billDetail.getPrice() * billDetail.getAmount());
        }
        newBill.setBillDetails(billDetails);

        billDao.saveNewBill(newBill);
        return "";
    }

    @RequestMapping("/view")
    public String getQuickView(Model model, HttpServletRequest request) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String param = request.getParameter("param");
        if (StringUtils.isEmpty(param)) {

        } else {
            int sumfee = 0;
            Map<String, Map<String, Object>> billDetail = jsonUtil.transJsonToBeanByGson(param, Map.class);
            List<Map<String, String>> list = new ArrayList<Map<String, String>>();
            Iterator<String> keys = billDetail.keySet().iterator();
            while (keys.hasNext()) {
                String key = keys.next();
                Map<String, String> map = new HashMap<String, String>();
                map.put("id", key);
                map.put("name", billDetail.get(key).get("name").toString());
                map.put("count", ((Double) billDetail.get(key).get("count")).intValue() + "");
                map.put("fee", ((Double) billDetail.get(key).get("fee")).intValue() + "");
                list.add(map);
                sumfee += Double.parseDouble(map.get("count")) * Double.parseDouble(map.get("fee"));
            }
            model.addAttribute("list", list);
            model.addAttribute("sumfee", sumfee);
        }

        return "bill/bill-view";
    }


}
