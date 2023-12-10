package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.RandomItem;

@Repository
public interface RandomItemRepository extends CrudRepository<RandomItem, Long> {
	List<RandomItem> findAll();
	
	// Random Functionality:
	List<RandomItem> findByUserId(Long userId);
}
