package com.christinac.wanderoo.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.christinac.wanderoo.models.Restaurant;
import com.christinac.wanderoo.repositories.RestaurantRepository;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantRepository restaurantRepo;
	
	// save restaurant
	public Restaurant create(Restaurant restaurant) {
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
}
