package com.fandian.controller;

import com.fandian.bean.BillDetail;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
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

    @RequestMapping("/new")
    public String toNewBillView(){
        return "menu/customer-view-1";
    }

    @RequestMapping(value = "/confirm",method = {RequestMethod.POST })
    public String confirmBill(@RequestBody List<BillDetail> billDetails){

        return "";
    }

    @RequestMapping("/view")
    public String getQuickView(Model model, HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String param = request.getParameter("param");
        if (StringUtils.isEmpty(param)){

        }else{
            int sumfee = 0;
            Map<String,Map<String,Object>> billDetail = jsonUtil.transJsonToBeanByGson(param,Map.class);
            List<Map<String,String>> list = new ArrayList<Map<String, String>>();
            Iterator<String> keys = billDetail.keySet().iterator();
            while (keys.hasNext()){
                String key = keys.next();
                Map<String,String> map = new HashMap<String, String>();
                map.put("id",key);
                map.put("name",billDetail.get(key).get("name").toString());
                map.put("count",((Double)billDetail.get(key).get("count")).intValue()+"");
                map.put("fee",((Double)billDetail.get(key).get("fee")).intValue()+"");
                list.add(map);
                sumfee += Double.parseDouble(map.get("count")) * Double.parseDouble(map.get("fee"));
            }
            model.addAttribute("list",list);
            model.addAttribute("sumfee",sumfee);
        }

        return "bill/bill-view";
    }


}
