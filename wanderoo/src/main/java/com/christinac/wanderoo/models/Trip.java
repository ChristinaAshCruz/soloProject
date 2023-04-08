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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
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
	private User tripCreator;
	
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
	@OneToMany(mappedBy="activityTripId", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Activity> trip;
	
	// creating restaurant list for 1 trip
	@OneToMany(mappedBy="restaurantTripId", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Restaurant> tripRestaurants;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public List<Activity> getTrip() {
		return trip;
	}
	public void setTrip(List<Activity> trip) {
		this.trip = trip;
	}
	public List<Restaurant> getTripRestaurants() {
		return tripRestaurants;
	}
	public void setTripRestaurants(List<Restaurant> tripRestaurants) {
		this.tripRestaurants = tripRestaurants;
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
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
