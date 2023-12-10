package com.mfrutchey.indecider.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mfrutchey.indecider.models.LoginUser;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	// Find user by ID:
	public User findById(Long id) {
		Optional<User> existingUser = userRepo.findById(id);
		if (existingUser.isPresent()) {
			return existingUser.get();
		} else {
			return null;
		}
	}
	
	// Registering a new user:
	
	// Checking if the email has already been taken:
	public User register(User newUser, BindingResult result) {
		Optional<User> existingUser = userRepo.findByEmail(newUser.getEmail());
		if (existingUser.isPresent()) {
			result.rejectValue("email", "Matches", "This email has already been registered.");
		}
		
		// If the email is available, check if passwords do NOT match:
		if (!newUser.getPassword().equals(newUser.getConfirmPassword())) {
			result.rejectValue("confirmPassword", "Matches", "Passwords do not match");
		}
		
		if (result.hasErrors()) {
			return null;
		}
		
		else {
			String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashedPassword);
			return userRepo.save(newUser);
		}
	}
	
	// Logging in a user:
	
	// Verify the association between an email and a registered user:
	public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> existingUser = userRepo.findByEmail(newLogin.getEmail());
		if (!existingUser.isPresent()) {
			result.rejectValue("email", "Matches", "Invalid email or password.");
			return null;
		}
		
		// If the email exists, check the password:
		User user = existingUser.get();
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid email or password.");
		}
		
		// Final error check before proceeding:
		if (result.hasErrors()) {
			return null;
		} else {
			return user;
		}
	}
	
}
