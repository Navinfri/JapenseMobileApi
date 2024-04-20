package com.japanese.appliaction.service.serviceInterface;

import java.util.List;

import com.japanese.appliaction.model.TypeOfQuestion;

public interface TypeOfQuestionApi {
	
	String save(TypeOfQuestion typeOfQuestion);

	public List<TypeOfQuestion> getAllQuestions();
	
	public TypeOfQuestion getById(Integer id);
	
	public String update(TypeOfQuestion typeOfQuestion);

	public String deleteById(Integer id);
}
