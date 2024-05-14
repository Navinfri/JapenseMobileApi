package com.japanese.appliaction.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	User findByemail(String userEmail);

	boolean existsByemail(String email);
   
}
