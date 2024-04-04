package com.japanese.appliaction.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
//Add Material
public class StudyMaterial {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long id;
	private String category;
	private String title;
	private String description;
	private String typeOfQuestion;
	
}
