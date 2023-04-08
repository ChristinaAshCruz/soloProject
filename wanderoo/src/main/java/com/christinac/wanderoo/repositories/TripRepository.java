package com.christinac.wanderoo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.christinac.wanderoo.models.Trip;

@Repository
public interface TripRepository extends CrudRepository<Trip,Long>{
	
	@Override
	public List<Trip> findAll();
}
