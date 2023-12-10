package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.Game;

@Repository
public interface GameRepository extends CrudRepository<Game, Long> {
	List<Game> findAll();
	
	// Random Functionality
	List<Game> findByUserId(Long userId);
}
