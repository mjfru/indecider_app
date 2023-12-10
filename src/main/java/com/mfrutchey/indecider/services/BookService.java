package com.mfrutchey.indecider.services;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mfrutchey.indecider.models.Book;
import com.mfrutchey.indecider.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	// Read All:
	public List<Book> allBooks() {
		return bookRepository.findAll();
	}
	
	// Read One:
	public Book findOneBook(Long id) {
		Optional<Book> existingBook = bookRepository.findById(id);
		if (existingBook.isPresent()) {
			return existingBook.get();
		} else {
			return null;
		}
	}
	
	// Random Functionality:
	public List<Book> findByUserId(Long userId) {
		return bookRepository.findByUserId(userId);
	}
	
	public Book getRandomBook(Long userId) {
		List<Book> userBooks = findByUserId(userId);
		if (userBooks.isEmpty()) {
			return null;
		} else {
			int randomIndex = new Random().nextInt(userBooks.size());
			return userBooks.get(randomIndex);
		}
	}
	
	// Create:
	public Book createBook(Book newBook) {
		return bookRepository.save(newBook);
	}
	
	// Update:
	public Book updateBook(Book updateBook) {
		return bookRepository.save(updateBook);
	}
	
	// Delete:
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}
}
