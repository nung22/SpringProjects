package com.nicholasung.hellohuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloHumanController {
	@RequestMapping("/")
    public String index(@RequestParam(value="name", required=false) String name, @RequestParam(value="last_name", required=false) String last_name, @RequestParam(value="times", defaultValue="1", required=false) String times) {
		if(name == null) {
			return "Hello Human";
		}
		if(last_name == null) {
			String output = "";
			for (int i = 0; i < Integer.parseInt(times); i++) {
				output += ("Hello " + name + " ");
			}
			return output;
		}
		return "Hello " + name + " " + last_name;
    }
}
