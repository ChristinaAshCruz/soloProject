package com.christinac.wanderoo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.christinac.wanderoo.models.Activity;
import com.christinac.wanderoo.models.Restaurant;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.repositories.ActivityRepository;

@Service
public class ActivityService {
	@Autowired
	private ActivityRepository activityRepo;
	@Autowired
	private UserService userServ;
	
	// find by id
	public Activity findById(Long id) {
		Optional<Activity> optionalActivity = activityRepo.findById(id);
		if (optionalActivity.isPresent()) {
			return optionalActivity.get();
		} else {
			return null;
		}
	}
	
	// create
	public Activity create(Activity activity) {
		return activityRepo.save(activity);
	}
	// update
	public Activity update(Activity activity) {
		return activityRepo.save(activity);
	}
	// delete
	public void deleteActivityById(Long id) {
		activityRepo.deleteById(id);
	}
	
	
	//add member attendance
	public void addMemberAttending(Long userId, Long activityId) {
		// find user attending event
		User user = userServ.findById(userId);
		// find activity member wants to attend
		Activity activity = findById(activityId);
		// get list of membersAttending
		List<User> membersAttending = activity.getMembersAttending();
		// add user to restaurant list
		membersAttending.add(user);
		// get list of user's restaurantsAttending + add restaurant to list
		userServ.update(user);
		update(activity);
	}
}
