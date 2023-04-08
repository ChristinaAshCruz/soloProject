package com.christinac.wanderoo.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.christinac.wanderoo.models.Activity;

@Repository
public interface ActivityRepository extends CrudRepository<Activity, Long>{

	@Override
	public List<Activity> findAll();
}
