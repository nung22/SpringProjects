package com.nicholasung.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
// 2. Importing dependencies
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@SpringBootApplication

public class HelloWorldApplication {
    public static void main(String[] args) {
            SpringApplication.run(HelloWorldApplication.class, args);
    }  
}