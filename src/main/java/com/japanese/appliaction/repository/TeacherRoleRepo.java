package com.japanese.appliaction.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.Teacher;
import com.japanese.appliaction.model.TeacherRole;

@Repository
public interface TeacherRoleRepo extends JpaRepository<TeacherRole, Long> {

	Optional<TeacherRole> findByUniqueIdAndTeacher(String uniqueId, String string);

	void deleteByTeacher(String teacherName);

	Optional<TeacherRole> findByUniqueId(String uniqueId);

}
