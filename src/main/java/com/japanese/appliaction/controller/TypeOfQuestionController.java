package com.japanese.appliaction.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.japanese.appliaction.model.TypeOfQuestion;
import com.japanese.appliaction.service.TypeOfQuestionsImp;

@RestController
public class TypeOfQuestionController {
	
	@Autowired 
	TypeOfQuestionsImp typeOfQuestionsImp;
	
	
	//Save Type of Questions
	@PostMapping("/saveTypeOfQuestions")
	public ResponseEntity<String> saveQuestions(@RequestBody TypeOfQuestion typeOfQuestion) {
	    String savedTypeOfQuestion = typeOfQuestionsImp.save(typeOfQuestion);
	    return ResponseEntity.status(HttpStatus.CREATED)
	            .body(savedTypeOfQuestion);
	}
	
	//list Type of Questions
	@GetMapping("/listAllQuestions")
	public ResponseEntity<List<TypeOfQuestion>> getAllQuetion(){
		List<TypeOfQuestion> list = typeOfQuestionsImp.getAllQuestions();
		return new ResponseEntity<>(list,HttpStatus.OK);
	}

	//Type of Quetion Find by Id
	@GetMapping("/questionFindById/{id}")
	public ResponseEntity<TypeOfQuestion> questionById(@PathVariable ("id") Integer id){
		TypeOfQuestion lisTypeOfQuestion= typeOfQuestionsImp.getById(id);
		return new ResponseEntity<>(lisTypeOfQuestion,HttpStatus.OK);
	}
	
	//update Type of Questions 
	@PutMapping("/upadateQueType")
	public ResponseEntity<String> updateQuetionType(@RequestBody TypeOfQuestion typeOfQuestion){
		String liString = typeOfQuestionsImp.update(typeOfQuestion);
		return new ResponseEntity<>(liString,HttpStatus.OK);
		
	}
	
	//delete Type of Questions
	@DeleteMapping("/deleteQueType/{id}")
	public ResponseEntity<String> quesDeleteById(@PathVariable ("id") Integer id){
		String list =typeOfQuestionsImp.deleteById(id);
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
}
