package com.japanese.appliaction.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.TeacherRoleAndPermissson;

@Repository
public interface TeacherRoleAndPermisssonRepo extends JpaRepository<TeacherRoleAndPermissson, Long> {

	TeacherRoleAndPermissson findByTeacher(String teacher);

}
