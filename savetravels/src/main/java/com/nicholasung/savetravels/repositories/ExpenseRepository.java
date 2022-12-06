package com.nicholasung.savetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.savetravels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long> {
    // this method retrieves all the books from the database
    List<Expense> findAll();
    // this method deletes a book that has a specific id
    void deleteById(Long id);
}
