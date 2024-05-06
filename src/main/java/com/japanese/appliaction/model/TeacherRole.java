package com.japanese.appliaction.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Entity
public class TeacherRole {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String teacher;
	
	@Column(length = 5000)
	private String courses;
	
	@Column(length = 5000)
	private String batchName;

	@Column(length = 5000)
	private String permissions;

	private String uniqueId;
	private boolean flag;

	@CreationTimestamp
	@Column(updatable = false)
	private LocalDate date;

}
