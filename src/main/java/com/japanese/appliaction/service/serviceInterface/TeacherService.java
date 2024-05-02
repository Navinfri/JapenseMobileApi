package com.japanese.appliaction.service.serviceInterface;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.japanese.appliaction.model.Teacher;
import java.util.Map;

public interface TeacherService {

	Teacher save(Teacher teacher);
	
	Teacher update(Long id,Teacher teacher);
	
	void deleteTeacher(Long id);
	
	List<Teacher> getAllTeacher();
	
	Optional<Teacher> getTeacherById(Long id);
	
	Optional<Teacher> getTeacherByFirstNameAndLastName(String firstName, String lastName);

	void updateTeacherAndPermission(String uniqueId, List<String> courses, List<String> batchName,
			Set<String> permissions);
	
	void deleteTeacherRoleByTeacherId(Long id);
	
	public void updateTeacherAndPermissionBoth(Long id, Map<String, Object> teacherData);
	
}
