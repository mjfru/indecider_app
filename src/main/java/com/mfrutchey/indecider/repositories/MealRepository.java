package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.Meal;

@Repository
public interface MealRepository extends CrudRepository<Meal, Long> {
	List<Meal> findAll();
	
	// Random Functionality
	List<Meal> findByUserId(Long userId);
}
