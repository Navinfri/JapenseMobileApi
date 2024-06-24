package com.japanese.appliaction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.AddQuestions;
import com.japanese.appliaction.repository.AddQuestionsRepo;
import com.japanese.appliaction.service.serviceInterface.AddQueImpl;

@Service
public class AddQueService implements AddQueImpl {
 
	@Autowired
	private AddQuestionsRepo addQuestionsRepo;
	
	@Override
	 public AddQuestions save(AddQuestions addQuestions) {
        return addQuestionsRepo.save(addQuestions);
	}

	
	
	
}
