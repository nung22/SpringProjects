package com.nicholasung.dojosAndNinjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.nicholasung.dojosAndNinjas.models.Dojo;
import com.nicholasung.dojosAndNinjas.models.Ninja;
import com.nicholasung.dojosAndNinjas.services.DojoService;
import com.nicholasung.dojosAndNinjas.services.NinjaService;

@Controller
public class MainController {
	@Autowired
	DojoService dojoService;
	
	@Autowired
	NinjaService ninjaService;
	
    @GetMapping("/")
    public String index() {
    	return "redirect:/dojos";    
    }
    
    @GetMapping("/dojos")
    public String dojo(@ModelAttribute("dojo") Dojo dojo, Model model) {
        List<Dojo> dojos = dojoService.allDojos();
        model.addAttribute("dojos", dojos);
        return "dojos.jsp";
    }
    @PostMapping("/dojos")
    public String createDojo(
    		Model model,
    		@Valid @ModelAttribute("dojo") Dojo dojo, 
    		BindingResult result) {
    	if (result.hasErrors()) {
            List<Dojo> dojos = dojoService.allDojos();
            model.addAttribute("dojos", dojos);
    		return "dojos.jsp";
    	}
    	dojoService.createDojo(dojo);
    	return "redirect:/";
    }
    
    @GetMapping("/dojos/{id}")
    public String show(
    		@PathVariable("id") Long id,
    		Model model) {
        Dojo dojo = dojoService.findDojo(id);
        model.addAttribute("dojo", dojo);
        model.addAttribute("ninjas", dojo.getNinjas());
        return "dojos_show.jsp";
    }
    
    @GetMapping("/ninjas/new")
    public String ninja(@ModelAttribute("ninja") Ninja ninja, Model model) {
        List<Dojo> dojos = dojoService.allDojos();
        model.addAttribute("dojos", dojos);
        return "ninjas.jsp";
    }
    @PostMapping("/ninjas/new")
    public String createNinja(
    		Model model,
    		@Valid @ModelAttribute("ninja") Ninja ninja, 
    		BindingResult result) {
    	if (result.hasErrors()) {
    		return "ninjas.jsp";
    	}
    	ninjaService.createNinja(ninja);
    	return "redirect:/dojos/" + ninja.getDojo().getId();
    }
    
    @GetMapping("/ninjas/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
    	Long tempId = ninjaService.findNinja(id).getDojo().getId();
    	ninjaService.deleteNinja(id);
    	return "redirect:/dojos/" + tempId;
    }
}
