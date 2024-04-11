package com.japanese.appliaction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.japanese.appliaction.model.TeacherRoleAndPermissson;
import com.japanese.appliaction.repository.TeacherRoleAndPermisssonRepo;
import com.japanese.appliaction.service.serviceInterface.TeacherRoleAndPermisssonService;

@Service
public class TeacherRoleAndPermisssonServiceImpl implements TeacherRoleAndPermisssonService {
	
	@Autowired
	TeacherRoleAndPermisssonRepo teacherRoleAndPermisssonRepo;

	@Override
	public String save(TeacherRoleAndPermissson teacherRoleAndPermissson) {
		TeacherRoleAndPermissson existingTeacher = teacherRoleAndPermisssonRepo.findByTeacher(teacherRoleAndPermissson.getTeacher());
	
		if(existingTeacher != null) {
			return "Teacher '" + existingTeacher.getTeacher() + "' already exists";
		}
		
		teacherRoleAndPermisssonRepo.save(teacherRoleAndPermissson);
		return "Teacher '" + teacherRoleAndPermissson.getTeacher() + "' ROLE / PERMISSION Is Saved Successfully";
	}
}
