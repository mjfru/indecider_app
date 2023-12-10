package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.RandomItem;
import com.mfrutchey.indecider.repositories.RandomItemRepository;

@Service
public class RandomItemService {

		@Autowired
		private RandomItemRepository randomItemRepository;
		
		// Read All:
		public List<RandomItem> allRandomItems() {
			return randomItemRepository.findAll();
		}
		
		// Read One:
		public RandomItem findOneRandomItem(Long id) {
			Optional<RandomItem> existingRandomItem = randomItemRepository.findById(id);
			if (existingRandomItem.isPresent()) {
				return existingRandomItem.get();
			} else {
				return null;
			}
		}
		
		// Random Functionality
		public List<RandomItem> findbyUserId(Long userId) {
			return randomItemRepository.findByUserId(userId);
		}
		
		public RandomItem getRandomRandomItem(Long userId) {
			List<RandomItem> userRandomItems = randomItemRepository.findByUserId(userId);
			// System.out.println("User RandomItems: " + userRandomItems);
			if (userRandomItems.isEmpty()) {
				return null;
			} else {
				int randomIndex = new Random().nextInt(userRandomItems.size());
				return userRandomItems.get(randomIndex);
			}
		}
		
		// Create:
		public RandomItem createRandomItem(RandomItem newRandomItem) {
			return randomItemRepository.save(newRandomItem);
		}
				
		// Delete
		public void deleteRandomItem(Long id) {
			randomItemRepository.deleteById(id);
		}
}
