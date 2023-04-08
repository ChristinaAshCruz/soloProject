package com.christinac.wanderoo.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.springframework.format.annotation.DateTimeFormat;

public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private Double distanceFromStay;
	private String cusineType;
	private Double platePriceAvg;
	private String infoLink;
	
	// RELATIONSHIPS:
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="creator_id")
	private User restaurantCreator;
	
	// relationship: trip where activity belongs to
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="restaurantTripId")
	private Trip restaurantTripId;
	
	// BONUS: creating a list to collect users who are attending this particular Restaurant
//	@ManyToMany(fetch=FetchType.LAZY)
//	@JoinTable(
//			//name middle table
//			name="restaurants_users",
//			joinColumns=@JoinColumn(name="restaurant_id"),
//			inverseJoinColumns=@JoinColumn(name="user_id")
//			)
//	private List<User> membersAttending; 
//	
//	
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
	public Double getDistanceFromStay() {
		return distanceFromStay;
	}
	public void setDistanceFromStay(Double distanceFromStay) {
		this.distanceFromStay = distanceFromStay;
	}
	public String getCusineType() {
		return cusineType;
	}
	public void setCusineType(String cusineType) {
		this.cusineType = cusineType;
	}
	public Double getPlatePriceAvg() {
		return platePriceAvg;
	}
	public void setPlatePriceAvg(Double platePriceAvg) {
		this.platePriceAvg = platePriceAvg;
	}
	public String getInfoLink() {
		return infoLink;
	}
	public void setInfoLink(String infoLink) {
		this.infoLink = infoLink;
	}
	public User getRestaurantCreator() {
		return restaurantCreator;
	}
	public void setRestaurantCreator(User restaurantCreator) {
		this.restaurantCreator = restaurantCreator;
	}
	public Trip getRestaurantTripId() {
		return restaurantTripId;
	}
	public void setRestaurantTripId(Trip restaurantTripId) {
		this.restaurantTripId = restaurantTripId;
	}
//	public List<User> getMembersAttending() {
//		return membersAttending;
//	}
//	public void setMembersAttending(List<User> membersAttending) {
//		this.membersAttending = membersAttending;
//	}
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
