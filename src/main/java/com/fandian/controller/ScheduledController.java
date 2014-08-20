package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.bean.Schedule;
import com.fandian.dao.BillDao;
import com.fandian.dao.ScheduledDao;
import com.fandian.util.JSONUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;
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
    public String getBookRecords(){
        Map<String, Object> result = new HashMap<String, Object>();
        Date today =new Date();

        result.put("data",scheduledDao.getBookRecords(new SimpleDateFormat("yyyy-MM-dd").format(today)));

        return jsonUtil.transToJsonStrByGson(result);
    }

    @RequestMapping("/getScheduledTableList")
    @ResponseBody
    public String getScheduledTableList(@RequestParam(required = false) String date,@RequestParam int area){
        List<Object> result = new ArrayList<Object>();

        List<Schedule> schedules = scheduledDao.getBookRecords(date,area);
        result.addAll(schedules);

        //查找未结账的桌子，这些也是不能预定的
        List<Bill> existedBills = billDao.getBills(date,0,area);
        result.addAll(existedBills);

        return jsonUtil.transToJsonStrByGson(result);
    }

}
