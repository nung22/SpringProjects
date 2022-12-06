package com.nicholasung.burgertracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.burgertracker.models.Burger;

public interface BurgerRepository extends CrudRepository<Burger, Long>{
    // this method retrieves all the books from the database
    List<Burger> findAll();
    // this method deletes a book that has a specific id
    void deleteById(Long id);
}
