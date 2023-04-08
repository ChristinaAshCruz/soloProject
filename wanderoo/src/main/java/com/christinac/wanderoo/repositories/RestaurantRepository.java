package com.christinac.wanderoo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.christinac.wanderoo.models.Restaurant;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, Long>{

	@Override
	public List<Restaurant> findAll();
}
