package com.japanese.appliaction.service.serviceInterface;

import java.util.List;

import com.japanese.appliaction.model.StudyMaterial;

public interface AddMaterialApi {
	
	public String save(StudyMaterial studyMaterial);
	
	public List<StudyMaterial> getAStudyMaterials();
	
	public StudyMaterial getMaterialById(Long id);
	
	public String update(StudyMaterial studyMaterial);
	
	public String deleteMaterialById(Long id);

}
