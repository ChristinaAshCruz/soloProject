package com.christinac.wanderoo.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.christinac.wanderoo.models.Activity;
import com.christinac.wanderoo.repositories.ActivityRepository;

@Service
public class ActivityService {
	@Autowired
	private ActivityRepository activityRepo;
	
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
}
