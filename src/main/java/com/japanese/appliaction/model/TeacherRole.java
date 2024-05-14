package com.japanese.appliaction.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
