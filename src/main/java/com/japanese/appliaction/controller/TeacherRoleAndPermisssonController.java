package com.japanese.appliaction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.japanese.appliaction.model.AddStudentSub;
import com.japanese.appliaction.model.TeacherRoleAndPermissson;
import com.japanese.appliaction.service.TeacherRoleAndPermisssonServiceImpl;

@RestController
public class TeacherRoleAndPermisssonController {
	
	@Autowired
	TeacherRoleAndPermisssonServiceImpl teacherRoleAndPermisssonServiceImpl;
	
	@PostMapping("/saveTeacherRoleAndPermissson")
	public ResponseEntity<String> saveTeacherRoleAndPermissson(@RequestBody TeacherRoleAndPermissson teacherRoleAndPermissson){
		String status = teacherRoleAndPermisssonServiceImpl.save(teacherRoleAndPermissson);
		return new ResponseEntity<>(status, HttpStatus.CREATED);
	}
	
}

