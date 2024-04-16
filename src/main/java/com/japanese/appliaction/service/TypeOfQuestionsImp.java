package com.japanese.appliaction.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.TypeOfQuestion;
import com.japanese.appliaction.repository.TypeOfQuestionsRepo;
import com.japanese.appliaction.service.serviceInterface.TypeOfQuestionApi;

@Service
public class TypeOfQuestionsImp implements TypeOfQuestionApi{
	
	@Autowired
	TypeOfQuestionsRepo typeOfQuestionsRepo;

	@Override
	public String save(TypeOfQuestion typeOfQuestion) {
		 typeOfQuestionsRepo.save(typeOfQuestion);
        return "Data Saved Successfully!";
	}

	@Override
	public List<TypeOfQuestion> getAllQuestions() {
		return typeOfQuestionsRepo.findAll();
	}

	@Override
	public TypeOfQuestion getById(Integer id) {
		Optional<TypeOfQuestion> question=typeOfQuestionsRepo.findById(id);
		if(question.isPresent()) {
			return question.get();
		}
		return null;
	}

	@Override
	public String update(TypeOfQuestion typeOfQuestion) {
Optional<TypeOfQuestion> existingQuestion = typeOfQuestionsRepo.findById(typeOfQuestion.getId());
	    
	    if(existingQuestion.isPresent()) {
	        TypeOfQuestion existingtype = existingQuestion.get();
	        
	        if(typeOfQuestion.getTypeOfQuestion() != null) {
	        	existingtype.setTypeOfQuestion(typeOfQuestion.getTypeOfQuestion());
	        }
	        
	        typeOfQuestionsRepo.save(existingtype);
	        
	        return "Data Updated Successfully!";
	    } else {
	        return "Type Of Question not found!";
	    }
	}

	@Override
	public String deleteById(Integer id) {
		if(typeOfQuestionsRepo.existsById(id)) {
			typeOfQuestionsRepo.deleteById(id);
			return "Record Deleted Successfully";
		} else {
		return "No Record Found";
	}
	}

}
