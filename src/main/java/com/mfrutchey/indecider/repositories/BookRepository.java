package com.mfrutchey.indecider.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mfrutchey.indecider.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
	
	// Random Functionality
	List<Book> findByUserId(Long userId);
}
