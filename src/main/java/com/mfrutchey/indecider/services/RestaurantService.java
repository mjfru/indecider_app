package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.Restaurant;
import com.mfrutchey.indecider.repositories.RestaurantRepository;

@Service
public class RestaurantService {
	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	// Read All:
	public List<Restaurant> allRestaurants() {
		return restaurantRepository.findAll();
	}
	
	// Read One:
	public Restaurant findOneRestaurant(Long id) {
		Optional<Restaurant> existingRestaurant = restaurantRepository.findById(id);
		if (existingRestaurant.isPresent()) {
			return existingRestaurant.get();
		} else {
			return null;
		}
	}
	
	// Random Functionality:
	public List<Restaurant> findByUserId(Long userId) {
		return restaurantRepository.findByUserId(userId);
	}
	
	public Restaurant getRandomRestaurant(Long userId) {
		List<Restaurant> userRestaurants = findByUserId(userId);
		if (userRestaurants.isEmpty()) {
			return null;
		} else {
			int randomIndex = new Random().nextInt(userRestaurants.size());
			return userRestaurants.get(randomIndex);
		}
	}
	
	// Create:
	public Restaurant createRestaurant(Restaurant newRestaurant) {
		return restaurantRepository.save(newRestaurant);
	}
	
	// Update:
	public Restaurant updateRestaurant(Restaurant updateRestaurant) {
		return restaurantRepository.save(updateRestaurant);
	}
	
	// Delete:
	public void deleteRestaurant(Long id) {
		restaurantRepository.deleteById(id);
	}
}
