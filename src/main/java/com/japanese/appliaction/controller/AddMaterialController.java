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

import com.japanese.appliaction.model.StudyMaterial;
import com.japanese.appliaction.service.AddMaterialImp;

@RestController
public class AddMaterialController {
	
	@Autowired
	AddMaterialImp  addMaterialImp ;
	
	//Save Add Material
	@PostMapping("/saveAddMaterial")
	public ResponseEntity<String> saveStudymaterial(@RequestBody StudyMaterial studyMaterial){
		String study = addMaterialImp.save(studyMaterial);
		return new ResponseEntity<>(study,HttpStatus.CREATED);
	}
	
	//list Material
	@GetMapping("/getAddMaterial")
	public ResponseEntity<List<StudyMaterial>> getStudyMaterialList(){
		List<StudyMaterial> study = addMaterialImp.getAStudyMaterials();
		return new ResponseEntity<>(study,HttpStatus.OK);
	}
	
	//Find By Id
	@GetMapping("/findMaterialById/{id}")
	public ResponseEntity<StudyMaterial> materialById(@PathVariable("id") Long id){
		StudyMaterial study =addMaterialImp.getMaterialById(id);
		return new ResponseEntity<>(study,HttpStatus.OK);
	}
	
	//Update Add Material
	@PutMapping("/updatematerial")
	public ResponseEntity<String> updateMaterial(@RequestBody StudyMaterial studyMaterial){
		String study = addMaterialImp.update(studyMaterial);
		return new ResponseEntity<>(study,HttpStatus.OK);
	}
	
	//Delete Add Material
	@DeleteMapping("/deleteAddMaterial/{id}")
	public ResponseEntity<String> materialDeleteById(@PathVariable("id") Long id){
		String study = addMaterialImp.deleteMaterialById(id);
		return new ResponseEntity<>(study,HttpStatus.OK);
	}
}
