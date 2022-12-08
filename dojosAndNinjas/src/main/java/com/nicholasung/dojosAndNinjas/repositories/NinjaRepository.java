package com.nicholasung.dojosAndNinjas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.dojosAndNinjas.models.Ninja;

public interface NinjaRepository extends CrudRepository<Ninja, Long> {
    // this method retrieves all the books from the database
    List<Ninja> findAll();
}
