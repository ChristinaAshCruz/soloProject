package com.christinac.wanderoo.models;

import java.util.Date;
import java.util.List;

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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="trips")
public class Trip {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message="A trip name is required!")
	private String tripName;
	@NotEmpty(message="A destination is required!")
	private String destination;
	@NotNull(message="A trip length is required!")
	@Min(value=0)
	private Integer lengthOfTrip;
	@NotEmpty(message="A short trip summary is required!")
	private String summary;
	
	//relationships:
	
	// who created this trip
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User tripCreator;
	
	// list of trip members
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="trips_users",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="trip_id")
			)
	private List<User> tripMembers;
	
	// list of trip's activities
	@OneToMany(mappedBy="trip", fetch=FetchType.LAZY)
	private List<Activity> tripActivities;
	
	// list of trip's restaurants
	@OneToMany(mappedBy="trip", fetch=FetchType.LAZY)
	private List<Restaurant> tripRestaurants;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	// 0-arg constructor
	public Trip() {}
	
	// getters and setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTripName() {
		return tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public Integer getLengthOfTrip() {
		return lengthOfTrip;
	}
	public void setLengthOfTrip(Integer lengthOfTrip) {
		this.lengthOfTrip = lengthOfTrip;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	// relationship getters and setters:
	public User getTripCreator() {
		return tripCreator;
	}

	public void setTripCreator(User tripCreator) {
		this.tripCreator = tripCreator;
	}
	
	public List<User> getTripMembers() {
		return tripMembers;
	}

	public void setTripMembers(List<User> tripMembers) {
		this.tripMembers = tripMembers;
	}
	
	
	
	public List<Activity> getTripActivities() {
		return tripActivities;
	}

	public void setTripActivities(List<Activity> tripActivities) {
		this.tripActivities = tripActivities;
	}
	
	
	

	public List<Restaurant> getTripRestaurants() {
		return tripRestaurants;
	}

	public void setTripRestaurants(List<Restaurant> tripRestaurants) {
		this.tripRestaurants = tripRestaurants;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
}
