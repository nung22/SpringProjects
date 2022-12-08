package com.nicholasung.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nicholasung.savetravels.models.Expense;
import com.nicholasung.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
    // adding the expense repository as a dependency
    private final ExpenseRepository expenseRepo;
    
    public ExpenseService(ExpenseRepository expenseRepo) {
        this.expenseRepo = expenseRepo;
    }
    // returns all the expenses
    public List<Expense> allExpenses() {
        return expenseRepo.findAll();
    }
    // creates a expense
    public Expense createExpense(Expense b) {
        return expenseRepo.save(b);
    }
    // retrieves a expense
    public Expense findExpense(Long id) {
    	return expenseRepo.findById(id).orElse(null);
    }
    // updates a expense
    public Expense updateExpense(Expense b) {
        return expenseRepo.save(b);
    }
    // deletes a expense
    public void deleteExpense(Long id) {
    	Optional<Expense> optionalExpense = expenseRepo.findById(id);
    	if(optionalExpense.isPresent()) {
    		expenseRepo.deleteById(id);    		
    	}
    }
}
