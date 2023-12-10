package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.Show;
import com.mfrutchey.indecider.repositories.ShowRepository;

@Service
public class ShowService {
	
	@Autowired
	private ShowRepository showRepository;
	
	// Read All:
	public List<Show> allShows() {
		return showRepository.findAll();
	}
	
	// Read One:
	public Show findOneShow(Long id) {
		Optional<Show> existingShow = showRepository.findById(id);
		if (existingShow.isPresent()) {
			return existingShow.get();
		} else {
			return null;
		}
	}
	
	// Random Functionality:
	public List<Show> findByUserId(Long userId) {
		return showRepository.findByUserId(userId);
	}
	
	public Show getRandomShow(Long userId) {
		List<Show> userShows = findByUserId(userId);
		if (userShows.isEmpty()) {
			return null;
		} else {
			int randomIndex = new Random().nextInt(userShows.size());
			return userShows.get(randomIndex);
		}
	}
	
	// Create:
	public Show createShow(Show newShow) {
		return showRepository.save(newShow);
	}
	
	// Update:
	public Show updateShow(Show updatedShow) {
		return showRepository.save(updatedShow);
	}
	
	// Delete:
	public void deleteShow(Long id) {
		showRepository.deleteById(id);
	}
}
