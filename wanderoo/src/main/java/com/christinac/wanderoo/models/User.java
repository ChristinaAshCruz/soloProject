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
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	//relationships:
	// list of trips created
	@OneToMany(mappedBy="tripCreator", fetch=FetchType.LAZY)
	private List<Trip> tripsCreated;
	
	// list of trips that user is a member of
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="trips_users",
			joinColumns=@JoinColumn(name="trip_id"),
			inverseJoinColumns=@JoinColumn(name="user_id")
			)
	private List<Trip> tripsAttending;

	// list of activities created
	@OneToMany(mappedBy="activityCreator", fetch=FetchType.LAZY)
	private List<Activity> activitiesCreated;
	
	// list of restaurants created
	@OneToMany(mappedBy="restaurantCreator", fetch=FetchType.LAZY)
	private List<Restaurant> restaurantsCreated;
	
	// list of activities attending
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="activities_users",
			joinColumns=@JoinColumn(name="activity_id"),
			inverseJoinColumns=@JoinColumn(name="user_id")
			)
	private List<Activity> activitiesAttending;
	// list of restaurants attending
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="restaurants_users",
			joinColumns=@JoinColumn(name="restaurant_id"),
			inverseJoinColumns=@JoinColumn(name="user_id")
			)
	private List<Restaurant> restaurantsAttending;
	
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
	
	// relationship getters and setters
	public List<Trip> getTripsCreated() {
		return tripsCreated;
	}

	public void setTripsCreated(List<Trip> tripsCreated) {
		this.tripsCreated = tripsCreated;
	}
	
	public List<Trip> getTripsAttending() {
		return tripsAttending;
	}

	public void setTripsAttending(List<Trip> tripsAttending) {
		this.tripsAttending = tripsAttending;
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
	
	public List<Activity> getActivitiesAttending() {
		return activitiesAttending;
	}

	public void setActivitiesAttending(List<Activity> activitiesAttending) {
		this.activitiesAttending = activitiesAttending;
	}
	
	
	
	public List<Restaurant> getRestaurantsAttending() {
		return restaurantsAttending;
	}

	public void setRestaurantsAttending(List<Restaurant> restaurantsAttending) {
		this.restaurantsAttending = restaurantsAttending;
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
