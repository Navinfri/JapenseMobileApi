package com.japanese.appliaction.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
//Add Material
public class StudyMaterial {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long id;
	private String title;
	private String meterialUsed;
	private String category;
	private String chapterName;
	private String typeOfQuestion;
	private String timeLimit;
	private LocalDate startDate;
	private LocalDate endDate;
	private String queLimitToDisplay;
	private String score;
	private String note;
	
	@CreationTimestamp
    @Column(updatable = false)
    private LocalDate date;
    private boolean Flag;
}
