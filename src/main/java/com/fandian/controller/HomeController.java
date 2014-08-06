package com.fandian.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home() {
	    	logger.info("requesting home");
		return "home";
	}

    @RequestMapping("/denied")
    public String denied(){
        return "denied";
    }

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(HttpServletRequest request,HttpServletResponse response) {
        String agent = request.getHeader("User-Agent");
        if (!StringUtils.isEmpty(agent) && (agent.toLowerCase().contains("iphone")
            || agent.toLowerCase().contains("ios") ||
                agent.toLowerCase().contains("ipad") ||
                agent.toLowerCase().contains("android"))){
            try {
                response.sendRedirect("/oauth/authorize");
            } catch (IOException e) {
                logger.warn("跳转微信oauth页异常",e);
            }
        }
        return "admin/login";
    }

}

