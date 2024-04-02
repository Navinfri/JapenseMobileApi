package com.japanese.appliaction.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.japanese.appliaction.model.Category;
import com.japanese.appliaction.service.CategoryImp;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryImp categoryImp;

	//Save Category 
	@PostMapping("/saveCategoryData")
	public ResponseEntity<String> saveCategory(@RequestBody Category category){
		String list = categoryImp.save(category);
		return new ResponseEntity<>(list, HttpStatus.CREATED);
	}
	
	//list Category
    @GetMapping("/listCategory")
    public ResponseEntity<List<Category>> getAllCategory(){
    	List<Category> list = categoryImp.getAllCAtegory();
    	return new ResponseEntity<>(list,HttpStatus.OK);
    }
    
    //Find By Id   
    @GetMapping("/categoryFindById/{id}")
    public ResponseEntity<Category> categoryById(@PathVariable("id") Integer id) {
        Category list = categoryImp.getById(id);
        return new ResponseEntity<>(list,HttpStatus.OK);
    }
    
    //update Category
    @PutMapping("/updateCategory")
    public ResponseEntity<String> updatCategory(@RequestBody Category category){
    	String list = categoryImp.update(category);
    	return new ResponseEntity<>(list,HttpStatus.OK);
    }
    
    //Delete Category
    @DeleteMapping("/deleteCategory/{id}")
    public ResponseEntity<String> categoryDeleteById(@PathVariable("id") Integer id){
    	String list = categoryImp.deleteById(id);
    	return new ResponseEntity<>(list,HttpStatus.OK);
    }

}


    