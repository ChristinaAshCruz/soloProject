package com.christinac.wanderoo.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	// RELATIONSHIPS:
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="creator_id")
	private User activityCreatedBy;
	
	// relationship: trip where activity belongs to
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="trip_id")
	private Trip trip;
	
	@OneToMany(mappedBy="restaurantAttendedBy", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<User> membersAttending;
}
