package com.christinac.wanderoo.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="trips")
public class Trip {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	//attributes needed:
		// String name
		// String destination
		// Integer lengthOfTrip
		// String summary
	
	@NotEmpty(message="A trip name is required!")
	private String name;
	@NotEmpty(message="A destination is required!")
	private String destination;
	@NotEmpty(message="The length of your trip is required!")
	private Integer lengthOfTrip;
	@NotEmpty(message="A summary is required!")
	private String summary;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="creator_id")
	private User createdBy;
	
		// relationship: list of users that are attending trip
			// will contain list of user_ids of members
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
				name="trips_users",
				joinColumns=@JoinColumn(name="user_id"),
				inverseJoinColumns=@JoinColumn(name="trip_id")
			)
	private List<User> tripMembers;
	
	// creating activity list for 1 trip
	@OneToMany(mappedBy="activityCreatedBy", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Activity> tripActivities;
	// creating restaurant list for 1 trip
	@OneToMany(mappedBy="restaurantCreatedBy", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Restaurant> tripRestaurants;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
}
