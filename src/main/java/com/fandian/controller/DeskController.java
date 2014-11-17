package com.fandian.controller;

import com.fandian.bean.Bill;
import com.fandian.dao.BillDao;
import com.fandian.util.SessionUtil;
import com.fandian.util.UserTypeJudger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2014/11/3.
 */
@Controller
@RequestMapping("/desk")
public class DeskController {

    @Inject
    private SessionUtil sessionUtil;

    @Inject
    private BillDao billDao;

    @RequestMapping("/{deskNo}")
    public String toScanDesk(@PathVariable String deskNo, HttpServletRequest request) throws AuthenticationException {

        if (deskNo == null){
            throw new AuthenticationException("param is invalid");
        }
        sessionUtil.addObjectToSession(SessionUtil.SESSION_SCAN_DESK_NUMBER_KEY,deskNo,request);

        //如果是服务员
        if (UserTypeJudger.isWaitor(SecurityContextHolder.getContext().getAuthentication())){
            return isWaitor(deskNo,request);
        }
        //如果是顾客
        if (UserTypeJudger.isCustomer(SecurityContextHolder.getContext().getAuthentication())){
            return isCustomer(deskNo,request);
        }

        return "redirect:/menu/customer/category";
    }

    public String isWaitor(String deskNo,HttpServletRequest request){
        sessionUtil.addObjectToSession(SessionUtil.SESSION_SCHEDULE_EXIST_KEY,true,request);
        Bill bill = billDao.getBillByTableNo(deskNo,0);
        //无桌单
        if (bill == null){
            return "redirect:/dish/category";
        }else{
            return "redirect:/cart/list";
        }

    }

    public String isCustomer(String deskNo,HttpServletRequest request){

        return "schedule/validate";
    }


}
