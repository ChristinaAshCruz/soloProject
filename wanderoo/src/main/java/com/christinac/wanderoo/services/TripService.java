package com.christinac.wanderoo.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.christinac.wanderoo.models.Trip;
import com.christinac.wanderoo.repositories.TripRepository;

@Service
public class TripService {
	@Autowired
	private TripRepository tripRepo;
	
	// find all
	public List<Trip> findAll() {
		return tripRepo.findAll();
	}
	
	// find by id
	public Trip findById(Long id) {
		Optional<Trip> optionalTrip = tripRepo.findById(id);
		if(optionalTrip.isPresent()) {
			return optionalTrip.get();
		} else {
			return null;
		}
	}
	// create new trip
	public Trip create(Trip trip) {
		return tripRepo.save(trip);
	}
	// update trip
	public Trip update(Trip trip) {
		return tripRepo.save(trip);
	}
	// delete trip
	public void deleteById(Long id) {
		tripRepo.deleteById(id);
	}
	
}
