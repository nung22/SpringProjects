package com.nicholasung.dojosAndNinjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nicholasung.dojosAndNinjas.models.Dojo;
import com.nicholasung.dojosAndNinjas.repositories.DojoRepository;

@Service
public class DojoService {
    // adding the dojo repository as a dependency
    private final DojoRepository dojoRepository;
    
    public DojoService(DojoRepository dojoRepository) {
        this.dojoRepository = dojoRepository;
    }
    // returns all the dojos
    public List<Dojo> allDojos() {
        return dojoRepository.findAll();
    }
    // creates a dojo
    public Dojo createDojo(Dojo b) {
        return dojoRepository.save(b);
    }
    // retrieves a dojo
    public Dojo findDojo(Long id) {
    	return dojoRepository.findById(id).orElse(null);
    }
    // updates a dojo
    public Dojo updateDojo(Dojo b) {
        return dojoRepository.save(b);
    }
    // deletes a dojo
    public void deleteDojo(Long id) {
    	Optional<Dojo> optionalDojo = dojoRepository.findById(id);
    	if(optionalDojo.isPresent()) {
    		dojoRepository.deleteById(id);    		
    	}
    }
}
