package com.japanese.appliaction.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.japanese.appliaction.model.Authorities;
import com.japanese.appliaction.model.User;
import com.japanese.appliaction.service.UserService;
import com.japanese.appliaction.utils.Constant;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class UserControllerAdmin {
	
	@Autowired
    private UserService userService;

    @PostMapping("/createUser")
    public ResponseEntity<Object>  createUser(@RequestBody User user) {
    	
    	boolean emailExists =userService.existsByemail(user.getEmail());
    	
    	if(emailExists) {
    		// Construct an error response for duplicate email ID
			Map<String, Object> response = new HashMap<>();
			response.put("message", "Email ID " + user.getEmail() + " is already in use");
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.ALREADY_REPORTED).body(response);
    		
    	}
    	
      return new ResponseEntity<>(userService.saveUserWithAuthorities(user),HttpStatus.CREATED);
    }

    
    @PostMapping("/logout")
    public ResponseEntity<String> logout(HttpServletRequest request, HttpServletResponse response) {
        // Invalidate the authentication session
        SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
        logoutHandler.logout(request, response, SecurityContextHolder.getContext().getAuthentication());
        
        // You can add additional logic here if needed
        
        return ResponseEntity.ok("Logged out successfully");
    }

    @GetMapping("/getAllUsers")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> userList = userService.findAll();
        if (!userList.isEmpty()) {
            userList.remove(0); // Remove the first element
        }
        return new ResponseEntity<>(userList, HttpStatus.OK);
    }
    
    
    @DeleteMapping("/deleteUsers/{userId}")
    public void deleteUserAndAuthorities(@PathVariable Long userId) {
        userService.deleteUserAndAuthorities(userId);
    }
    

     @GetMapping("/findUserById/{userId}")
     public ResponseEntity<Optional<User>> getUserWithAuthorities
     (@PathVariable("userId") long userId) {
       Optional<User> userOptional = userService.findByUserId(userId);
    
    if (userOptional.isPresent()) {
        return ResponseEntity.ok(userOptional);
    } else {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(userOptional);
    }
   }
     
     
     @PutMapping("/toggle-flag/{userId}")
     public ResponseEntity<String> toggleFlag(@PathVariable Long userId) {
         boolean flagToggled = userService.toggleUserFlag(userId);
         if (flagToggled) {
             return ResponseEntity.ok("Flag toggled successfully");
         } else {
             return ResponseEntity.notFound().build();
         }
     }
     
     @PutMapping("/updateUser")
     public ResponseEntity<Object> updateUser( @RequestBody User user) {
         // Check if the user exists
         if (!userService.existsById(user.getId())) {
             return new ResponseEntity<>("User not found", HttpStatus.NOT_FOUND);
         }
         User updatedUser = userService.updateUser(user);

         return new ResponseEntity<>(updatedUser, HttpStatus.OK);
     }
     
     
   

}
