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
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="activities")
public class Activity {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@NotEmpty(message="An activity name is required!")
	private String name;
	@NotEmpty(message="A distance from your stay is required!")
	private Double distanceFromStay;
	@NotEmpty(message="An activity type is required!")
	private String activityType;
	@NotEmpty(message="An short summary is required!")
	private String summary;
	private String infoLink;
	
	// relationships:
	// who created activity
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User activityCreator;
	
	// which trip does this activity belong to
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="trip_id")
	private Trip trip;
	
	// who is attending this restaurant
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="activities_users",
			joinColumns=@JoinColumn(name="user_id"),
			inverseJoinColumns=@JoinColumn(name="activity_id")
			)
	private List<User> membersAttending;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	//0-arg constructor
	public Activity() {}
	
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
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
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
	
	// relationship getters and setters
	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
	}
	
	public User getActivityCreator() {
		return activityCreator;
	}

	public void setActivityCreator(User activityCreator) {
		this.activityCreator = activityCreator;
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
