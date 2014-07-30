package com.fandian.controller;

import com.fandian.bean.Customer;
import com.fandian.bean.User;
import com.fandian.dao.CustomerDao;
import com.fandian.dao.UserDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by gan on 14-7-22.
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Inject
    private CustomerDao customerDao;

    @Inject
    public JSONUtil jsonUtil;

    @RequestMapping("/list")
    public
    @ResponseBody
    String listInternal() {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("data", customerDao.getAllCustomers());
        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/updateCustomer")
    public
    @ResponseBody
    String updateCustomer(@RequestParam String param) {
        try {
            Customer customer = jsonUtil.transJsonToBeanByGson(param, Customer.class);
            if(customer.getId() == 0){
                customerDao.insertCustomer(customer);
            }else
                customerDao.updateCustomer(customer);
            return "{\"success\":true}";
        }catch (Exception e){
            return "{\"success\":false}";
        }
    }

    @RequestMapping("/delCustomer")
    public @ResponseBody String delUser(@RequestParam int customerId){
        try {
            customerDao.deleteCustomer(customerId);
            return "{\"success\":true}";
        }catch (Exception e){
            return "{\"success\":false}";
        }
    }

    @RequestMapping("/checkout")
    public @ResponseBody String checkout(@RequestParam int customerId){
        try {
            customerDao.updateCheckoutInfo(customerId);
            return "{\"success\":true}";
        }catch (Exception e){
            return "{\"success\":false}";
        }
    }

}
