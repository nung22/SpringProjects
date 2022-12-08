package com.nicholasung.dojosAndNinjas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nicholasung.dojosAndNinjas.models.Dojo;

public interface DojoRepository extends CrudRepository<Dojo, Long> {
    // this method retrieves all the books from the database
    List<Dojo> findAll();
}
