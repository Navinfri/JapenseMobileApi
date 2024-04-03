package com.japanese.appliaction.service.serviceInterface;

import java.util.List;

import com.japanese.appliaction.model.Category;

public interface CategoryApi {
	
	 public  String save(Category category);
	 
	 public List<Category> getAllCAtegory();
	 
	 public Category getById(Integer id);

	 public String update(Category category);
	
	 public String deleteById(Integer id);
}
