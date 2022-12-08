package com.nicholasung.savetravels.controllers;

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
import org.springframework.web.bind.annotation.PutMapping;

import com.nicholasung.savetravels.models.Expense;
import com.nicholasung.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseService;
    
    // Redirect from index to expenses route
    @GetMapping("/")
    public String index() {
    	return "redirect:/expenses";
    }
    
    // Renders expenses page with dashboard & create expense form 
    @GetMapping("/expenses")
    public String expenses(@ModelAttribute("expense") Expense expense, Model model) {
    	// Add expense list to view model for populating dashboard
        List<Expense> expenses = expenseService.allExpenses();
        model.addAttribute("expenses", expenses);
        return "expenses.jsp";
    }
    // Saves new expense 
    @PostMapping("/expenses")
    public String create(
    		Model model,
    		@Valid @ModelAttribute("expense") Expense expense, 
    		BindingResult result) {
    	// Renders expenses page with errors if erroneous data is inputed
    	if (result.hasErrors()) {
            List<Expense> expenses = expenseService.allExpenses();
            model.addAttribute("expenses", expenses);
    		return "expenses.jsp";
    	}
    	// Redirects to expenses page when a new expense is successfully created
    	expenseService.createExpense(expense);
    	return "redirect:/";
    }
    
    @GetMapping("/expenses/{id}")
    public String show(
    		@PathVariable("id") Long id,
    		Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "/expenses/show.jsp";
    }
    
    @GetMapping("/expenses/edit/{id}")
    public String edit(
    		@PathVariable("id") Long id,
    		Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "/expenses/edit.jsp";
    }
    @PutMapping("/expenses/{id}")
    public String update(
    		@PathVariable("id") Long id,
    		Model model,
    		@Valid @ModelAttribute("expense") Expense expense, 
    		BindingResult result) {
    	if (result.hasErrors()) {
    		return "/expenses/edit.jsp";
    	}
    	expenseService.updateExpense(expense);
    	return "redirect:/";
    }
    
    @GetMapping("/expenses/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
    	expenseService.deleteExpense(id);
    	return "redirect:/";
    }
}
