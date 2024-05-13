package com.japanese.appliaction.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private String course;
	private String category;
	private String chapterName;
	private String typeOfQuestion;
	private String timeLimit;
	private String startDate;
	private String endDate;
	private String queLimitToDisplay;
	private String score;
	private String note;
	
	@CreationTimestamp
    @Column(updatable = false)
    private LocalDate date;
    private boolean Flag;
}
