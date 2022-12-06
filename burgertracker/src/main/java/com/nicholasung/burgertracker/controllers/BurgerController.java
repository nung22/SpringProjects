package com.nicholasung.burgertracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.nicholasung.burgertracker.models.Burger;
import com.nicholasung.burgertracker.services.BurgerService;

@Controller
public class BurgerController {
    private final BurgerService burgerService;
    public BurgerController(BurgerService burgerService){
        this.burgerService = burgerService;
    }
    
    @GetMapping("/")
    public String index(@ModelAttribute("burger") Burger burger, Model model) {
        List<Burger> burgers = burgerService.allBurgers();
        model.addAttribute("burgers", burgers);
        return "burgers.jsp";
    }
    @PostMapping("/burgers")
    public String create(
    		Model model,
    		@Valid @ModelAttribute("burger") Burger burger, 
    		BindingResult result) {
    	if (result.hasErrors()) {
            List<Burger> burgers = burgerService.allBurgers();
            model.addAttribute("burgers", burgers);
    		return "burgers.jsp";
    	}
    	burgerService.createBurger(burger);
    	return "redirect:/";
    }
    
    @GetMapping("/burgers/edit/{id}")
    public String edit(
    		@PathVariable("id") Long id,
    		Model model) {
        Burger burger = burgerService.findBurger(id);
        model.addAttribute("burger", burger);
        return "edit.jsp";
    }
    @PutMapping("/burgers")
    public String update(
    		@Valid @ModelAttribute("burger") Burger burger, 
    		BindingResult result) {
    	if (result.hasErrors()) {
    		return "edit.jsp";
    	}
    	burgerService.updateBurger(burger);
    	return "redirect:/";
    }
    
    @GetMapping("/burgers/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
    	burgerService.deleteBurger(id);
    	return "redirect:/";
    }
}
