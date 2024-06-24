package com.japanese.appliaction.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.AddQuestions;

@Repository
public interface AddQuestionsRepo extends JpaRepository<AddQuestions, Long>{

	 @Query("SELECT COALESCE(MAX(q.questionPaperId), 0) FROM AddQuestions q")
	    Long findMaxQuestionPaperId();

}
