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
public class Batches {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String course;
	private String batchName;
	private String batchDemoDate;
	private String batchStartDate;
	private String batchEndDate;
	private String classesDay;
	private String teacher;
	private String batchFees;
	private String zoomDetails;
	
	@CreationTimestamp
    @Column(updatable = false)
    private LocalDate date;
    private boolean Flag;
}
