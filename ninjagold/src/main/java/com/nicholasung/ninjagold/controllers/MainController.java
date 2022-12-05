package com.nicholasung.ninjagold.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	Random rand = new Random();
	Date date = new Date();
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/Gold";
	}
	
	@RequestMapping("/Gold")
	public String gold(HttpSession session) {
		if(session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		if((Integer) session.getAttribute("gold") < -50) {
			return "prison.jsp";
		}
		return "gold.jsp";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping("/find_gold")
	public String findGold(
		@RequestParam(value="action") String action,
		HttpSession session) {
		Integer gold = 0;
		String message = "You ";
		if(action.equals("quest")) {
			gold = rand.nextInt(51);
			boolean loseGold = rand.nextBoolean();
			if(loseGold) {
				gold *= -1;
				message += String.format("failed a %s and lost %d gold. Ouch. ", action, gold);
			} else {
				message += String.format("completed a %s and earned %d gold. ", action, gold);
			}
		} else if(action.equals("spa")) {
			gold = -(rand.nextInt(16) + 5);
			message += String.format("entered a %s and lost %d gold. ", action, gold);
	    } else {
	    	if(action.equals("farm")) {
				gold = rand.nextInt(11) + 10;
	    	}
	    	if(action.equals("cave")) {
				gold = rand.nextInt(6) + 5;
	    	}
	    	if(action.equals("house")) {
				gold = rand.nextInt(4) + 2;
	    	}
			message += String.format("entered a %s and earned %d gold. ", action, gold);
		}
		session.setAttribute("gold", (Integer) session.getAttribute("gold") + gold);
		SimpleDateFormat formatter = new SimpleDateFormat("MMMM dd, yyyy hh:mm aa");
		String time = formatter.format(date);
		message += String.format("(%s)", time);
		ArrayList<String> activityLog = new ArrayList<String>();
		if(session.getAttribute("actions") != null) {
			activityLog = (ArrayList<String>) session.getAttribute("actions");
		}
		activityLog.add(message);
		session.setAttribute("actions", activityLog);
		return "redirect:/";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/prison")
	public String prison(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
