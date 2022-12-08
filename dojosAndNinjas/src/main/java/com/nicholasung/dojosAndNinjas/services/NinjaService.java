package com.nicholasung.dojosAndNinjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nicholasung.dojosAndNinjas.models.Ninja;
import com.nicholasung.dojosAndNinjas.repositories.NinjaRepository;

@Service
public class NinjaService {
    // adding the ninja repository as a dependency
    private final NinjaRepository ninjaRepository;
    
    public NinjaService(NinjaRepository ninjaRepository) {
        this.ninjaRepository = ninjaRepository;
    }
    // returns all the ninjas
    public List<Ninja> allNinjas() {
        return ninjaRepository.findAll();
    }
    // creates a ninja
    public Ninja createNinja(Ninja b) {
        return ninjaRepository.save(b);
    }
    // retrieves a ninja
    public Ninja findNinja(Long id) {
    	return ninjaRepository.findById(id).orElse(null);
    }
    // updates a ninja
    public Ninja updateNinja(Ninja b) {
        return ninjaRepository.save(b);
    }
    // deletes a ninja
    public void deleteNinja(Long id) {
    	Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
    	if(optionalNinja.isPresent()) {
    		ninjaRepository.deleteById(id);    		
    	}
    }
}
