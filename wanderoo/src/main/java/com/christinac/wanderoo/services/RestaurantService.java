package com.christinac.wanderoo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.christinac.wanderoo.models.Restaurant;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.repositories.RestaurantRepository;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantRepository restaurantRepo;
	@Autowired
	private UserService userServ;
	
	// save restaurant
	public Restaurant create(Restaurant restaurant) {
		return restaurantRepo.save(restaurant);
	}
	
	// update 
	public Restaurant update(Restaurant restaurant) {
		return restaurantRepo.save(restaurant);
	}
	// find by id
	public Restaurant findById(Long id) {
		Optional<Restaurant> optionalRestaurant = restaurantRepo.findById(id);
		if (optionalRestaurant.isPresent()) {
			return optionalRestaurant.get();
		} else {
			return null;
		}
	}
	
	// add member to membersAttending
	public void addMemberAttending(Long userId, Long restaurantId) {
		// find user attending event
		User user = userServ.findById(userId);
		// find restauarant member wants to attend
		Restaurant restaurant = findById(restaurantId);
		// get list of membersAttending
		List<User> membersAttending = restaurant.getMembersAttending();
		// add user to restaurant list
		membersAttending.add(user);
		// get list of user's restaurantsAttending + add restaurant to list
		userServ.update(user);
		update(restaurant);
	}
	
	// delete restaurant
	public void deleteById(Long restaurantId) {
		restaurantRepo.deleteById(restaurantId);
	}
}
