package com.nicholasung.helloworld;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {
	@RequestMapping("/")
    // Method that maps to the request route above
    public String hello() {
            return "Hello World! Updated";
    }
}
