package com.christinac.wanderoo.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="activities")
public class Activity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	// attributes needed:
		// String name
		// Double distanceFromStay
		// String activityType
		// String summary
		// String extraNotes
	
	@NotEmpty(message="An activity name is required!")
	private String name;
	@NotEmpty(message="A distance amount is required!")
	private Double distanceFromStay;
	@NotEmpty(message="An activity type is required!")
	private String activityType;
	@NotEmpty(message="A short summary is required!")
	private String summary;
	private String extraNotes;
	
	//notes for tomorrow
		// add relation mapping connecting each activity to what trip it belongs to
		// add relation mapping connecting ea. activity to user who created it
		
	
}
