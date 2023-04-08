package com.christinac.wanderoo.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.christinac.wanderoo.models.LoginUser;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	// user registration
	public User register(User u, BindingResult result) {
		// if the confirmPassword != password
		Optional<User> potentialUser = userRepo.findByEmail(u.getEmail());
		if(potentialUser.isPresent()) {
			result.rejectValue("email", null, "This email is already taken");
		}
		if(!u.getConfirmPass().equals(u.getPassword())) {
			// add error to your confirPassword input in your jsp
			result.rejectValue("confirPassword", null, "Passwords do not match!");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashPW = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
		u.setPassword(hashPW);
		return userRepo.save(u);
	}
	
	// user login
	public User login(LoginUser l, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(l.getEmail());
		// if the optionalUser is empty OR if  the check password fails -> return null
		if (optionalUser.isEmpty() || !BCrypt.checkpw(l.getPassword(), optionalUser.get().getPassword())){
			result.rejectValue("password", null, "Incorrect email or password!");
			return null;
		} else {
		// ELSE -> return the user object 
			return optionalUser.get();
		}
	}
	
	// Find:
	// find all users
	public List<User> findAll(){
		return userRepo.findAll();
	}
	// find user by id
	public User findById(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if(optionalUser.isPresent()) {			
			return optionalUser.get();
		} else {
			return null;
		}
	}
	
}
