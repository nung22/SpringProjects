package com.nicholasung.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nicholasung.savetravels.models.Expense;
import com.nicholasung.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
    // adding the expense repository as a dependency
    private final ExpenseRepository expenseRepository;
    
    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }
    // returns all the expenses
    public List<Expense> allExpenses() {
        return expenseRepository.findAll();
    }
    // creates a expense
    public Expense createExpense(Expense b) {
        return expenseRepository.save(b);
    }
    // retrieves a expense
    public Expense findExpense(Long id) {
    	return expenseRepository.findById(id).orElse(null);
    }
    // updates a expense
    public Expense updateExpense(Expense b) {
        return expenseRepository.save(b);
    }
    // deletes a expense
    public void deleteExpense(Long id) {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if(optionalExpense.isPresent()) {
    		expenseRepository.deleteById(id);    		
    	}
    }
}
