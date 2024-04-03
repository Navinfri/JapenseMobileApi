package com.japanese.appliaction.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.Category;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Integer>{

	Optional<Category> findById(Integer id);
	
	boolean existsById(Integer id);
	
	void deleteById(Integer id);
}
