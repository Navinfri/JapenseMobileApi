package com.japanese.appliaction.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.Authorities;
import com.japanese.appliaction.model.User;
import com.japanese.appliaction.repository.AuthoritiesRepository;
import com.japanese.appliaction.repository.UserRepository;





@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private AuthoritiesRepository authoritiesRepository;

 // Assuming you have a method to save a user with authorities in your UserService
    @Transactional
    public User saveUserWithAuthorities(User user) {
    	
    	    String plainPassword = user.getPassword();
    	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    	    String encryptedPassword = passwordEncoder.encode(plainPassword);
    	    user.setPassword(encryptedPassword);
    	
        // Save user
        User savedUser = userRepository.save(user);
        
        // Set user for each authority and save authorities
        List<Authorities> authorities = user.getAuthorities();
        for (Authorities authority : authorities) {
            authority.setUser(savedUser);// Set the user for each authority
            authoritiesRepository.save(authority);
        }

        return savedUser;
    }


    public List<User> findAll() {
        return userRepository.findAll();
    }

    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }


	public boolean existsByemail(String email) {
		return userRepository.existsByemail(email);
	}


	@Transactional
	public void deleteUserAndAuthorities(Long userId) {
		authoritiesRepository.deleteByUserId(userId);
		userRepository.deleteById(userId);
       
		
	}


	public Optional<User> findByUserId(long userId) {
	    Optional<User> userOptional = userRepository.findById(userId);
	    
	    if (userOptional.isPresent()) {
	        User user = userOptional.get();
	        List<Authorities> authorities = authoritiesRepository.findByUserId(userId);
	        user.setAuthorities(authorities);
	        return Optional.of(user);
	    } else {
	        return Optional.empty();
	    }
	}
	
	
	 public boolean toggleUserFlag(Long userId) {
	        Optional<User> optionalUser = userRepository.findById(userId);
	        if (optionalUser.isPresent()) {
	            User user = optionalUser.get();
	            user.setFlag(!user.isFlag()); // Toggle the flag
	            userRepository.save(user); // Save the updated user
	            return true;
	        } else {
	            return false; // User not found
	        }
	    }


	public boolean existsById(Long userId) {
		// TODO Auto-generated method stub
		return userRepository.existsById(userId);
	}


	@Transactional
	public User updateUser(User user) {
	    // Check if user exists
	    User existingUser = userRepository.findById(user.getId()).orElse(null);
	    if (existingUser == null) {
	        throw new RuntimeException("User not found");
	    }

	    // Update user details
	    existingUser.setName(user.getName());
	    existingUser.setEmail(user.getEmail());
	    existingUser.setMobileNumber(user.getMobileNumber());
	    existingUser.setModule(user.getModule());

	    // Update authorities
	    List<Authorities> authorities = user.getAuthorities();
	    if (authorities != null) {
	        for (Authorities authority : authorities) {
	            // Check if authority exists
	            List<Authorities> existingAuthorities = authoritiesRepository.findByUserId(existingUser.getId());
	            
	            if (existingAuthorities != null && !existingAuthorities.isEmpty()) {
	                // Assuming there's only one authority per user for simplicity
	                Authorities existingAuthority = existingAuthorities.get(0);
	                existingAuthority.setEmail(authority.getEmail());
	                existingAuthority.setRoleName(authority.getRoleName());
	                existingAuthority.setUser(existingUser);
	                authoritiesRepository.save(existingAuthority);
	            } 
	        }
	       // existingUser.setAuthorities(authorities);
	    }

	    // Save updated user
	    return userRepository.save(existingUser);
	}


	public Authorities findByemail(String userEmail) {
		// TODO Auto-generated method stub
		return authoritiesRepository.findByemail(userEmail);
	}





}
