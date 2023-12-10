package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.Game;
import com.mfrutchey.indecider.repositories.GameRepository;

@Service
public class GameService {
	
	@Autowired
	private GameRepository gameRepository;
	
	// Read All:
	public List<Game> allGames() {
		return gameRepository.findAll();
	}
	
	// Read One:
	public Game findOneGame(Long id) {
		Optional<Game> existingGame = gameRepository.findById(id);
		if (existingGame.isPresent()) {
			return existingGame.get();
		} else {
			return null;
		}
	}
	
	// Random Functionality:
	public List<Game> findByUserId(Long userId) {
		return gameRepository.findByUserId(userId);
	}
	
	public Game getRandomGame(Long userId) {
		List<Game> userGames = findByUserId(userId);
		if (userGames.isEmpty()) {
			return null;
		} else {
			int randomIndex = new Random().nextInt(userGames.size());
			return userGames.get(randomIndex);
		}
	}
	
	// Create:
	public Game createGame(Game newGame) {
		return gameRepository.save(newGame);
	}
	
	// Update:
	public Game updateGame(Game updateGame) {
		return gameRepository.save(updateGame);
	}
	
	// Delete:
	public void deleteGame(Long id) {
		gameRepository.deleteById(id);
	}
}
