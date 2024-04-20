package com.japanese.appliaction.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.TypeOfQuestion;

@Repository
public interface TypeOfQuestionsRepo extends JpaRepository<TypeOfQuestion, Integer>{

	Optional<TypeOfQuestion> findById(Integer id);
	
	boolean existsById(Integer id);
	
	void deleteById(Integer id);
}
