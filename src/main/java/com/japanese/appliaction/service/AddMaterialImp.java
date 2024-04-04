package com.japanese.appliaction.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.StudyMaterial;
import com.japanese.appliaction.repository.AddMeterialRepo;
import com.japanese.appliaction.service.serviceInterface.AddMaterialApi;

@Service
public class AddMaterialImp implements AddMaterialApi {

	@Autowired
	AddMeterialRepo addMeterialRepo ;
	
	
	@Override
	public String save(StudyMaterial studyMaterial) {
		addMeterialRepo.save(studyMaterial);
		return "Data Saved Successfully!";
	}

	@Override
	public List<StudyMaterial> getAStudyMaterials() {
		return addMeterialRepo.findAll();
	}

	@Override
	public StudyMaterial getMaterialById(Long id) {
		Optional<StudyMaterial> study = addMeterialRepo.findById(id);
		if(study.isPresent()) {
			return study.get();
		}
		return null;
	}

	@Override
	public String update(StudyMaterial studyMaterial) {
	    Optional<StudyMaterial> existingMaterialOptional = addMeterialRepo.findById(studyMaterial.getId());
	    
	    if (existingMaterialOptional.isPresent()) {
	        StudyMaterial existingStudyMaterial = existingMaterialOptional.get();

	        if (studyMaterial.getCategory() != null) {
	            existingStudyMaterial.setCategory(studyMaterial.getCategory());
	        }

	        if (studyMaterial.getTitle() != null) {
	            existingStudyMaterial.setTitle(studyMaterial.getTitle());
	        }

	        if (studyMaterial.getDescription() != null) {
	            existingStudyMaterial.setDescription(studyMaterial.getDescription());
	        }

	        if (studyMaterial.getTypeOfQuestion() != null) {
	            existingStudyMaterial.setTypeOfQuestion(studyMaterial.getTypeOfQuestion());
	        }

	        
	        addMeterialRepo.save(existingStudyMaterial);
	        
	        return "Data Updated Successfully!";
	    } else {
	        return "Study Material not found!";
	    }
	}


	@Override
	public String deleteMaterialById(Long id) {
		if(addMeterialRepo.existsById(id)) {
			addMeterialRepo.deleteById(id);
			return "Record Deleted Successfully";
        } else {
            return "No Record Found";
        }
	}

}
