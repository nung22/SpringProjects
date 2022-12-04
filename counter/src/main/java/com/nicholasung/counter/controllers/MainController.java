package com.nicholasung.counter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/")
	public String index(HttpSession session) {
		if(session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		} else {
			session.setAttribute("count", (Integer) session.getAttribute("count") + 1);
		}
		return "index.jsp";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("count", 0);
		return "index.jsp";
	}
	
	@RequestMapping("/counter")
	public String count(HttpSession session) {
//		session.getAttribute("count");
		return "counter.jsp";
	}
	
	@RequestMapping("/counter_by_2")
	public String countBy2(HttpSession session) {
		if(session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		} else {
			session.setAttribute("count", (Integer) session.getAttribute("count") + 2);
		}
		return "counter_by_2.jsp";
	}
}
