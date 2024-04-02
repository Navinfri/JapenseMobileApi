package com.japanese.appliaction.service;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.Category;
import com.japanese.appliaction.repository.CategoryRepo;
import com.japanese.appliaction.service.serviceInterface.CategoryApi;

@Service
public class CategoryImp implements CategoryApi {

	@Autowired 
	CategoryRepo categoryRepo ;
	
	@Override
	public String save(Category category) {
	    categoryRepo.save(category);
	    return "Data Saved Successfully!";
	}

	@Override
	public List<Category> getAllCAtegory() {
		return categoryRepo.findAll();
	}

	@Override
	public Category getById(Integer id) {
		Optional<Category> cate = categoryRepo.findById(id);
		if(cate.isPresent()) {
			return cate.get();
		}
		return null;
	}

	@Override
	public String update(Category category) {
	    Optional<Category> existingCategoryOptional = categoryRepo.findById(category.getId());
	    
	    if(existingCategoryOptional.isPresent()) {
	        Category existingCategory = existingCategoryOptional.get();
	        
	        if(category.getCategory() != null) {
	            existingCategory.setCategory(category.getCategory());
	        }
	        
	        categoryRepo.save(existingCategory);
	        
	        return "Data Updated Successfully!";
	    } else {
	        return "Category not found!";
	    }
	}

	@Override
	public String deleteById(Integer id) {
		if(categoryRepo.existsById(id)) {
			categoryRepo.deleteById(id);
			return "Record Deleted Successfully";
        } else {
            return "No Record Found";
        }
	}

	

}
