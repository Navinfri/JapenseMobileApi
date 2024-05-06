package com.japanese.appliaction.repository;

import java.util.Optional;
import java.util.Set;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.japanese.appliaction.model.Teacher;

@Repository
public interface TeacherRepo extends JpaRepository<Teacher, Long> {

	boolean existsByEmailId(String emailId);

	Optional<Teacher> findByFirstNameAndLastName(String firstName, String lastName);

	Optional<Teacher> findByUniqueId(String uniqueId);

}
