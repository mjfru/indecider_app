package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.Meal;
import com.mfrutchey.indecider.repositories.MealRepository;

@Service
public class MealService {

	@Autowired
	private MealRepository mealRepository;
	
	// Real All:
	public List<Meal> allMeals() {
		return mealRepository.findAll();
	}
	
	// Read One:
	public Meal findOneMeal(Long id) {
		Optional<Meal> existingMeal = mealRepository.findById(id);
		if (existingMeal.isPresent()) {
			return existingMeal.get();
		} else {
			return null;
		}
	}
	
	// Random Functionality
	public List<Meal> findByUserId(Long userId) {
		return mealRepository.findByUserId(userId);
	}
	
	public Meal getRandomMeal(Long userId) {
		List<Meal> userMeals = findByUserId(userId);
		if (userMeals.isEmpty()) {
			return null;
		} else {
			int randomIndex = new Random().nextInt(userMeals.size());
			return userMeals.get(randomIndex);
		}
	}
	
	// Create:
	public Meal createMeal(Meal newMeal) {
		return mealRepository.save(newMeal);
	}
	
	// Update:
	public Meal updateMeal(Meal updateMeal) {
		return mealRepository.save(updateMeal);
	}
	
	// Delete:
	public void deleteMeal(Long id) {
		mealRepository.deleteById(id);
	}
}
