package com.fandian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2014/11/3.
 */
@Controller
@RequestMapping("/desk")
public class DeskController {

    public static final String SESSION_SCAN_DESK_NUMBER_KEY = "_fandian_scan_desk_num";

    @RequestMapping("/{deskNo}")
    public String toScanDesk(@PathVariable String deskNo, HttpServletRequest request) throws AuthenticationException {

        if (deskNo == null){
            throw new AuthenticationException("param is invalid");
        }

        request.getSession().setAttribute(SESSION_SCAN_DESK_NUMBER_KEY,deskNo);

        return "redirect:/menu/customer/category";
    }
}
