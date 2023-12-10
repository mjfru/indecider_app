package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.Restaurant;

@Repository
public interface RestaurantRepository extends CrudRepository<Restaurant, Long> {
	List<Restaurant> findAll();
	
	// Random Functionality:
	List<Restaurant> findByUserId(Long userId);
}