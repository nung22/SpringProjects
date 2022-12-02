package com.nicholasung.displaydate.controllers;

import java.util.Date;
import java.text.SimpleDateFormat;  
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DisplayDateController {
	Date date = new Date();
	
	@RequestMapping("/")
	public String index(Model model) {
		
		return "index.jsp";
	}
	
	@RequestMapping("/date")
	public String date(Model model) {
		SimpleDateFormat weekDay = new SimpleDateFormat("EEEE");
		SimpleDateFormat day = new SimpleDateFormat("dd");
		SimpleDateFormat monthYear = new SimpleDateFormat("MMMM, yyyy");
		String strDate = String.format("%s, the %s of %s",weekDay.format(date),day.format(date),monthYear.format(date));
		model.addAttribute("date", strDate);
		return "date.jsp";
	}
	
	@RequestMapping("/time")
	public String time(Model model) {
		SimpleDateFormat formatter = new SimpleDateFormat("hh:mm aa");
		String strTime = formatter.format(date);
		model.addAttribute("time", strTime);
		return "time.jsp";
	}
}
