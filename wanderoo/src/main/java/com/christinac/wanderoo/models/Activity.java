package com.christinac.wanderoo.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
	private String infoLink;
	private String extraNotes;
	
	// relationship: user who created activity
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="creator_id")
	private User activityCreator;
	
	// relationship: trip where activity belongs to
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="activity_trip_id")
	private Trip activityTripId;
	
	// BONUS: creating a list to collect users who are attending this particular activity
//	@ManyToMany(fetch=FetchType.LAZY)
//	@JoinTable(
//				name="activties_users",
//				joinColumns=@JoinColumn(name="activity_id"),
//				inverseJoinColumns=@JoinColumn(name="user_id")
//			)
//	private List<User> membersAttending;
	//notes for tomorrow
		// add relation mapping connecting each activity to what trip it belongs to
		// add relation mapping connecting ea. activity to user who created it
	
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
	public String getExtraNotes() {
		return extraNotes;
	}
	public void setExtraNotes(String extraNotes) {
		this.extraNotes = extraNotes;
	}
	public User getActivityCreator() {
		return activityCreator;
	}
	public void setActivityCreator(User activityCreator) {
		this.activityCreator = activityCreator;
	}
	public Trip getActivityTripId() {
		return activityTripId;
	}
	public void setActivityTripId(Trip activityTripId) {
		this.activityTripId = activityTripId;
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
