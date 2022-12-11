package com.nicholasung.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.nicholasung.bookclub.models.LoginUser;
import com.nicholasung.bookclub.models.User;
import com.nicholasung.bookclub.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    // TO-DO: Write register and login methods!
    public User register(User newUser, BindingResult result) {
    	// TO-DO - Reject values or register if no errors:
        
        // Reject if email is taken (present in database)
    	if(userRepo.findByEmail(newUser.getEmail()).isPresent()) {
    	    result.rejectValue("email", "Taken", "This email is already taken!");
    	}
        // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    	    result.rejectValue("confirm", "Matches", "The passwords must match!");
    	}
        // Return null if result has errors
    	if(result.hasErrors()) {
    	    // Exit the method and go back to the controller 
    	    // to handle the response
    		System.out.println("Found Reg Error");
    	    return null;
    	}
        // Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
        return userRepo.save(newUser);
    }
    public User login(LoginUser newLogin, BindingResult result) {
        // TO-DO - Reject values:
        
    	// Find user in the DB by email
        // Reject if NOT present
    	if(!this.checkEmail(newLogin.getEmail())) {
    	    result.rejectValue("email", "Present", "Invalid credentials!");
    	}
        // Reject if BCrypt password match fails
    	User user = userRepo.findByEmail(newLogin.getEmail()).orElse(null);
    	if(user != null) {
    		String potentialHashed = BCrypt.hashpw(newLogin.getPassword(), BCrypt.gensalt());
    		if(!(user.getPassword() != potentialHashed)) {
    			result.rejectValue("password", "Matches", "Invalid credentials!");    			
    		}
    	}
        // Return null if result has errors
    	if(result.hasErrors()) {
    	    // Exit the method and go back to the controller 
    	    // to handle the response
    		System.out.println("Found Login Error");
    	    return null;
    	}
        // Otherwise, return the user object
    	return user;
    }
    
    // check if email is in database
    public boolean checkEmail(String email) {
    	Optional<User> potentialUser = userRepo.findByEmail(email);
    	return potentialUser.isPresent();
    }
    
    // returns all the users
    public List<User> allUsers() {
        return userRepo.findAll();
    }
    // creates a user
    public User createUser(User b) {
        return userRepo.save(b);
    }
    // retrieves a user
    public User findUser(Long id) {
    	return userRepo.findById(id).orElse(null);
    }
    // updates a user
    public User updateUser(User b) {
        return userRepo.save(b);
    }
    // deletes a user
    public void deleteUser(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	if(optionalUser.isPresent()) {
    		userRepo.deleteById(id);    		
    	}
    }
}
