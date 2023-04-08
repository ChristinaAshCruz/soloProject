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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="restaurants")
public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	private String name;
	private Double distanceFromStay;
	private String activityType;
	private String Summary;
	private String infoLink;
	
	//relationships:
	// who created restaurant
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User restaurantCreator;
	
	// which trip does this restaurant belong to
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="trip_id")
	private Trip trip;
	
	// who is attending this activity
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="restaurants_users",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="restaurant_id")
			)
	private List<User> membersAttending;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	// 0-arg constructor
	public Restaurant() {}

	// getters and setters
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

	public Double getDistanceFromStay() {
		return distanceFromStay;
	}

	public void setDistanceFromStay(Double distanceFromStay) {
		this.distanceFromStay = distanceFromStay;
	}

	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public String getSummary() {
		return Summary;
	}

	public void setSummary(String summary) {
		Summary = summary;
	}

	public String getInfoLink() {
		return infoLink;
	}

	public void setInfoLink(String infoLink) {
		this.infoLink = infoLink;
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
	
	
	//relationship getters and setters:
	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}
	
	public User getRestaurantCreator() {
		return restaurantCreator;
	}

	public void setRestaurantCreator(User restaurantCreator) {
		this.restaurantCreator = restaurantCreator;
	}
	
	public List<User> getMembersAttending() {
		return membersAttending;
	}

	public void setMembersAttending(List<User> membersAttending) {
		this.membersAttending = membersAttending;
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
