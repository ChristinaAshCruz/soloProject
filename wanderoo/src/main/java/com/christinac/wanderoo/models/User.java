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
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="users")
public class User {
	
	//attributes
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message="Name is required!")
	private String name;
	@NotEmpty(message="Email is required!")
	@Email
	private String email;
	@NotEmpty(message="Password is required!")
	private String password;
	@Transient
	private String confirmPass;
	
	// relationship to other models
	@OneToMany(mappedBy="tripCreator", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Trip> trips;
	
	
		// relationship: list of group trips that user is attending
			// will contain trip_ids from those trips that user is a member of
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
				name="trips_users",
				joinColumns=@JoinColumn(name="trip_id"),
				inverseJoinColumns=@JoinColumn(name="user_id")
			)
	private List<Trip> groupTripsAttending;
	
	// list of activities created by user
	@OneToMany(mappedBy="activityCreator", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Activity> activitiesCreated;
	
	// list of restaurants created by user
	@OneToMany(mappedBy="restaurantCreator", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Restaurant> restaurantsCreated;

	// list of activities user is attending
//	@ManyToMany(fetch=FetchType.LAZY)
//	@JoinTable(
//			//name middle table
//			name="restaurants_users",
//			joinColumns=@JoinColumn(name="user_id"),
//			inverseJoinColumns =@JoinColumn(name="restaurant_id")
//			)
//	private List<Restaurant> restaurantsAttending; 
//	
//	@ManyToMany(fetch=FetchType.LAZY)
//	@JoinTable(
//				name="activities_users",
//				joinColumns=@JoinColumn(name="user_id"),
//				inverseJoinColumns=@JoinColumn(name="activity_id")
//			)
//	private List<Activity> activitesAttending;
	
	
	// list of restaurants is attending
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	//constructor
	public User() {}
	
	//getters and setters
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

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPass() {
		return confirmPass;
	}

	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
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
	
	public List<Trip> getTrips() {
		return trips;
	}

	public void setTrips(List<Trip> trips) {
		this.trips = trips;
	}

	public List<Trip> getGroupTripsAttending() {
		return groupTripsAttending;
	}

	public void setGroupTripsAttending(List<Trip> groupTripsAttending) {
		this.groupTripsAttending = groupTripsAttending;
	}

	public List<Activity> getActivitiesCreated() {
		return activitiesCreated;
	}

	public void setActivitiesCreated(List<Activity> activitiesCreated) {
		this.activitiesCreated = activitiesCreated;
	}

	public List<Restaurant> getRestaurantsCreated() {
		return restaurantsCreated;
	}

	public void setRestaurantsCreated(List<Restaurant> restaurantsCreated) {
		this.restaurantsCreated = restaurantsCreated;
	}
	
	

//	public List<Restaurant> getRestaurantsAttending() {
//		return restaurantsAttending;
//	}
//
//	public void setRestaurantsAttending(List<Restaurant> restaurantsAttending) {
//		this.restaurantsAttending = restaurantsAttending;
//	}
//
//	public List<Activity> getActivitesAttending() {
//		return activitesAttending;
//	}
//
//	public void setActivitesAttending(List<Activity> activitesAttending) {
//		this.activitesAttending = activitesAttending;
//	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	

}
