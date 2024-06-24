package com.japanese.appliaction.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
public class AddQuestions {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
    private Long questionPaperId ;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	@Lob
	@Column(length = 1000000) 
	private byte[] audioFile;
	private String correctAnswer;
	private String description;
	@Lob
	@Column(length = 1000000) 
	private byte[] genericFile;
	@Lob
	@Column(length = 1000000) 
	private byte[] imageFile;
	private String textQuestion;
	
	@CreationTimestamp
	   @Column(updatable = false)
	   private LocalDate date;
	   private boolean Flag;


}
