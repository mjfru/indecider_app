package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.Show;

@Repository
public interface ShowRepository extends CrudRepository<Show, Long> {
	List<Show> findAll();
	
	// Random Functionality:
	List<Show> findByUserId(Long userId);
}