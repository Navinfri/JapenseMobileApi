package com.japanese.appliaction.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.config.ConfigDataResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.japanese.appliaction.model.Teacher;
import com.japanese.appliaction.model.TeacherRole;
import com.japanese.appliaction.repository.TeacherRepo;
import com.japanese.appliaction.repository.TeacherRoleRepo;
import com.japanese.appliaction.service.serviceInterface.TeacherService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private TeacherRepo teacherRepo;

	@Autowired
	private TeacherRoleRepo teacherRoleAndPermisssonRepo;

	@Override
	public Teacher save(Teacher teacher) {
		return teacherRepo.save(teacher);
	}

	public boolean existsByEmailId(String emailId) {
		return teacherRepo.existsByEmailId(emailId);
	}

	@Override
	public Teacher update(Long id, Teacher teacher) {
		Optional<Teacher> optionalTeacher = teacherRepo.findById(id);
		if (!optionalTeacher.isPresent()) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Teacher not found with id: " + id);
		}

		Teacher existingTeacher = optionalTeacher.get();
		existingTeacher.setFirstName(teacher.getFirstName());
		existingTeacher.setLastName(teacher.getLastName());
		existingTeacher.setLastName(teacher.getGender());
		existingTeacher.setEmailId(teacher.getEmailId());
		existingTeacher.setPassword(teacher.getPassword());
		existingTeacher.setUniqueId(teacher.getUniqueId());
		existingTeacher.setFlag(teacher.isFlag());
		existingTeacher.setDate(teacher.getDate());

		return teacherRepo.save(existingTeacher);
	}

	@Override
	public void deleteTeacher(Long id) {
		teacherRepo.deleteById(id);
	}

	@Override
	public List<Teacher> getAllTeacher() {
		return teacherRepo.findAll();
	}

	@Override
	public Optional<Teacher> getTeacherById(Long id) {
		return teacherRepo.findById(id);
	}

	@Override
	public Optional<Teacher> getTeacherByFirstNameAndLastName(String firstName, String lastName) {
		return teacherRepo.findByFirstNameAndLastName(firstName, lastName);
	}

	@Override
	public void updateTeacherAndPermission(String uniqueId, List<String> courses, List<String> batchName,
			Set<String> permissions) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();

			// Update Teacher table
			Teacher teacher = teacherRepo.findByUniqueId(uniqueId)
					.orElseThrow(() -> new RuntimeException("Teacher not found"));

			teacher.setCourses(objectMapper.writeValueAsString(courses));
			teacher.setBatchName(objectMapper.writeValueAsString(batchName));
			teacher.setPermissions(objectMapper.writeValueAsString(permissions));

			teacherRepo.save(teacher);

			// Check if TeacherRole entry already exists
			Optional<TeacherRole> existingTeacherRoleOpt = teacherRoleAndPermisssonRepo
					.findByUniqueIdAndTeacher(uniqueId, teacher.getFirstName() + " " + teacher.getLastName());

			TeacherRole teacherRoleAndPermission;
			if (existingTeacherRoleOpt.isPresent()) {
				// Update existing entry
				teacherRoleAndPermission = existingTeacherRoleOpt.get();
				teacherRoleAndPermission.setCourses(objectMapper.writeValueAsString(courses));
				teacherRoleAndPermission.setBatchName(objectMapper.writeValueAsString(batchName));
				teacherRoleAndPermission.setPermissions(objectMapper.writeValueAsString(permissions));
			} else {
				// Create new entry
				teacherRoleAndPermission = new TeacherRole();
				teacherRoleAndPermission.setTeacher(teacher.getFirstName() + " " + teacher.getLastName());
				teacherRoleAndPermission.setUniqueId(uniqueId);
				teacherRoleAndPermission.setCourses(objectMapper.writeValueAsString(courses));
				teacherRoleAndPermission.setBatchName(objectMapper.writeValueAsString(batchName));
				teacherRoleAndPermission.setPermissions(objectMapper.writeValueAsString(permissions));
			}

			teacherRoleAndPermisssonRepo.save(teacherRoleAndPermission);
		} catch (JsonProcessingException e) {
			throw new RuntimeException("Error processing JSON", e);
		}
	}

}
