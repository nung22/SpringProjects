package com.nicholasung.omikuji.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@RequestMapping("/")
	public String index() {
		return "redirect:/omikuji";
	}
	
	@RequestMapping("/omikuji")
	public String omikuji() {
		return "omikuji.jsp";
	}
	
	@PostMapping("/submit")
	public String submit(
		@RequestParam(value="number") int number,
		@RequestParam(value="city") String city,
		@RequestParam(value="person") String person,
		@RequestParam(value="activity") String activity,
		@RequestParam(value="organism") String organism,
		@RequestParam(value="phrase") String phrase,
		HttpSession session) {
		session.setAttribute("number", number);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("activity", activity);
		session.setAttribute("organism", organism);
		session.setAttribute("phrase", phrase);
		return "redirect:/omikuji/show";
	}
	
	@RequestMapping("/omikuji/show")
	public String show(HttpSession session) {
		if(session.getAttribute("person") == null) {
			return "redirect:/";
		}
		return "omikuji_show.jsp";
	}
}
