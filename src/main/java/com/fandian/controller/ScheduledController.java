package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.Schedule;
import com.fandian.dao.BillDao;
import com.fandian.dao.ScheduledDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by gan on 14-8-20.
 */
@Controller
@RequestMapping("/book")
public class ScheduledController {

    @Inject
    private JSONUtil jsonUtil;

    @Inject
    private ScheduledDao scheduledDao;

    @Inject
    private BillDao billDao;

    @RequestMapping("/list")
    @ResponseBody
    public String getBookRecords(@RequestParam(required = false) String date){
        Map<String, Object> result = new HashMap<String, Object>();
        Date today =new Date();

        String queryDate = null;
        if(StringUtils.isEmpty(date))
            queryDate = new SimpleDateFormat("yyyy-MM-dd").format(today);
        else
            queryDate = date;

        result.put("data",scheduledDao.getBookRecords(queryDate));
        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/getScheduledTableList")
    @ResponseBody
    public String getScheduledTableList(@RequestParam(required = false) String date,@RequestParam String area){

        List<Object> result = new ArrayList<Object>();

        List<Schedule> schedules = scheduledDao.getBookRecords(date,area);
        result.addAll(schedules);

        //查找未结账的桌子，这些也是不能预定的
        List<Bill> existedBills = billDao.getBills(date,0,area);
        result.addAll(existedBills);

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/updateSchedule")
    @ResponseBody
    public String updateSchedule(@ModelAttribute Schedule schedule){

        int scheduleId = schedule.getId();
        if(scheduleId == 0){
            scheduledDao.insertSchedule(schedule);
        }else{
            scheduledDao.updateSchedule(schedule);
        }

        return "{\"success\":true}";
    }

    @RequestMapping("/cancelSchedule")
    @ResponseBody
    public String cancelSchedule(@RequestParam int scheduleId){
        scheduledDao.delSchedule(scheduleId);
        return "{\"success\":true}";
    }

    /**
     * 校验手机号码是否存在预约信息
     * @param mobile
     * @return
     */
    @RequestMapping("/validSchedule")
    @ResponseBody
    public String validSchedule(@RequestParam String mobile, HttpServletRequest request){
        Map<String,Object> result = new HashMap<String, Object>();
        try {
            List<Schedule> schedules = scheduledDao.getBookRecords(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            if (schedules != null && schedules.size() > 0){
                for (Schedule schedule : schedules){
                    if (schedule.getPhoneNum().equals(mobile)){
                        result.put("success",true);
                        request.getSession().setAttribute(MenuController.SESSION_USER_BOOK_PHONE_KEY,schedule.getPhoneNum());
                        break;
                    }
                }
            }

            if (result.get("success") == null){
                result.put("success",false);
            }
        } catch (Exception e) {
            result.put("success", false);
        }
        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("noSchedule")
    public String noSchedule(HttpServletRequest request){
        request.getSession().setAttribute(MenuController.SESSION_USER_BOOK_PHONE_KEY,MenuController.SESSION_USER_BOOK_PHONE_VAL_NONE);
        return "redirect:/menu/customer/category";
    }
}
