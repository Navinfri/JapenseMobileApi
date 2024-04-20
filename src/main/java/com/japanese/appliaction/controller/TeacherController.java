package com.japanese.appliaction.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.japanese.appliaction.model.Teacher;
import com.japanese.appliaction.service.TeacherServiceImpl;
import com.japanese.appliaction.utils.Constant;

@RestController
public class TeacherController {

	@Autowired
	private TeacherServiceImpl teacherServiceImpl;

	/* Create Teacher */

	// SAVE
	@PostMapping("/saveTeacher")
	public ResponseEntity<Object> saveTeacher(@RequestBody Teacher teacher) {
		try {
			// Check if email ID already exists
			boolean emailExists = teacherServiceImpl.existsByEmailId(teacher.getEmailId());

			if (emailExists) {

				// Construct an error response for duplicate email ID
				Map<String, Object> response = new HashMap<>();
				response.put("status", Constant.ERROR_RESPONSE_STATUS);
				response.put("statusCode", Constant.DUPLICATE_EMAIL_RESPONSE_CODE);
				response.put("message", "Email ID " + teacher.getEmailId() + " is already in use");
				response.put("data", Collections.emptyList());

				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
			}

			// Generate uniqueId using UUID
			teacher.setUniqueId(UUID.randomUUID().toString());
			teacher.setStatus("Active");
			Teacher savedTeacher = teacherServiceImpl.save(teacher);

			// Construct a success response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.SUCCESS_RESPONSE_STATUS);
			response.put("statusCode", Constant.SUCCESS_RESPONSE_CODE);
			response.put("message", "Teacher : " + teacher.getFirstName() + " " + teacher.getLastName()
					+ " information is saved successfully");
			response.put("data", savedTeacher);

			return ResponseEntity.status(HttpStatus.CREATED).body(response);
		} catch (Exception e) {
			// Construct a generic error response for other exceptions
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.ERROR_RESPONSE_STATUS);
			response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
			response.put("message", "Failed to save teacher information");
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// UPDATE
	@PutMapping("/updateTeacher/{id}")
	public ResponseEntity<Object> updateTeacherById(@PathVariable Long id, @RequestBody Teacher teacher) {
		try {
			Teacher updateTeacher = teacherServiceImpl.update(id, teacher);

			// Construct a success response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.SUCCESS_RESPONSE_STATUS);
			response.put("statusCode", Constant.SUCCESS_RESPONSE_CODE);
			// response.put("message", "Teacher information is updated successfully for Id :
			// " + id);
			response.put("message", "Teacher information is updated successfully");
			response.put("data", updateTeacher);

			return ResponseEntity.status(HttpStatus.CREATED).body(response);
		} catch (Exception e) {
			// Construct an error response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.ERROR_RESPONSE_STATUS);
			response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
			response.put("message", "Failed to update teacher information for Id : " + id);
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// DELETE
	@DeleteMapping("/deleteTeacher/{id}")
	public ResponseEntity<Object> deleteTeacherById(@PathVariable Long id) {
		try {
			teacherServiceImpl.deleteTeacher(id);

			// Construct a success response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.SUCCESS_RESPONSE_STATUS);
			response.put("statusCode", Constant.SUCCESS_RESPONSE_CODE);
			// response.put("message", "Teacher is deleted successfully for Id : " + id);
			response.put("message", "Teacher is deleted successfully");

			return ResponseEntity.status(HttpStatus.OK).body(response);
		} catch (Exception e) {
			// Construct an error response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.ERROR_RESPONSE_STATUS);
			response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
			response.put("message", "Failed to delete teacher for Id : " + id);
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// FETCH ALL TEACHER
	@GetMapping("/getAllTeacher")
	public ResponseEntity<Object> getAllTeacher() {
		try {
			List<Teacher> teachers = teacherServiceImpl.getAllTeacher();

			// Construct a success response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.SUCCESS_RESPONSE_STATUS);
			response.put("statusCode", Constant.SUCCESS_RESPONSE_CODE);
			response.put("message", "All teachers fetched successfully");
			response.put("data", teachers);

			return ResponseEntity.status(HttpStatus.OK).body(response);
		} catch (Exception e) {
			// Construct an error response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.ERROR_RESPONSE_STATUS);
			response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
			response.put("message", "Failed to fetch teachers data");
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	// FETCH TEACHER BY ID
	@GetMapping("/teacher/{id}")
	public ResponseEntity<Object> getTeacherById(@PathVariable Long id) {
		try {
			Optional<Teacher> optional = teacherServiceImpl.getTeacherById(id);
			if (optional.isPresent()) {
				Teacher teacher = optional.get();

				// Construct a success response
				Map<String, Object> response = new HashMap<>();
				response.put("status", Constant.SUCCESS_RESPONSE_STATUS);
				response.put("statusCode", Constant.SUCCESS_RESPONSE_CODE);
				response.put("message", "Teacher fetched successfully");
				response.put("data", teacher);

				return ResponseEntity.status(HttpStatus.OK).body(response);
			} else {
				// Construct an error response if the course is not found
				Map<String, Object> response = new HashMap<>();
				response.put("status", Constant.ERROR_RESPONSE_STATUS);
				response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
				response.put("message", "Teacher not found with ID: " + id);
				response.put("data", Collections.emptyList());

				return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
			}
		} catch (Exception e) {
			// Construct an error response
			Map<String, Object> response = new HashMap<>();
			response.put("status", Constant.ERROR_RESPONSE_STATUS);
			response.put("statusCode", Constant.ERROR_RESPONSE_CODE);
			response.put("message", "Failed to fetch teachers data");
			response.put("data", Collections.emptyList());

			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	/* Teacher - Role/Permission */

	// Fetch Teacher Data By FirstName And LastName
	@GetMapping("/getTeacherByFullName")
	public ResponseEntity<?> getTeacherByFullName(@RequestParam String firstName, @RequestParam String lastName) {
		Optional<Teacher> teacher = teacherServiceImpl.getTeacherByFirstNameAndLastName(firstName, lastName);
		if (teacher.isPresent()) {
			return ResponseEntity.ok(teacher);
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	// Save data to TeacherRole table & update data to Teacher table
	@PostMapping("/updateRole")
	public ResponseEntity<String> updateTeacherDetails(@RequestBody Map<String, Object> request) {
		String uniqueId = (String) request.get("uniqueId");

		ObjectMapper objectMapper = new ObjectMapper();

		try {
			// Convert courses, batchName, and permissions directly to ArrayList or HashSet
			List<String> courses = (List<String>) request.get("courses");
			List<String> batchName = (List<String>) request.get("batchName");
			Set<String> permissions = new HashSet<>((List<String>) request.get("permissions"));

			// Convert lists to JSON strings
			String coursesJson = objectMapper.writeValueAsString(courses);
			String batchNameJson = objectMapper.writeValueAsString(batchName);
			String permissionsJson = objectMapper.writeValueAsString(permissions);

			teacherServiceImpl.updateTeacherAndPermission(uniqueId, courses, batchName, permissions);
			return new ResponseEntity<>("Data saved successfully", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
