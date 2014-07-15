package com.fandian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Created with IntelliJ IDEA.
 * User: ganhaitian
 * Date: 14-7-14
 * Time: 下午11:30
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class WebchartController {

    @RequestMapping(value = "/testEcho", method = RequestMethod.GET)
    @ResponseBody
    public String testEcho(@RequestParam String signature, @RequestParam String timestamp, @RequestParam String nonce, @RequestParam String echostr) {
        return echostr;
    }


}
