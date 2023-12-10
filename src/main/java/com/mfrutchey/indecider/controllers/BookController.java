package com.mfrutchey.indecider.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.mfrutchey.indecider.models.Book;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.BookService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BookService bookService;
	
	// Read All / Form Page:
	@GetMapping("/books")
	public String bookForm(@ModelAttribute("newBook") Book newBook, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Book> allBooks = bookService.allBooks();
			model.addAttribute("allBooks", allBooks);
			return "bookForm.jsp";
		}
	}
	
	// Read One:
	@GetMapping("/books/{id}")
	public String viewBook(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Book book = bookService.findOneBook(id);
			model.addAttribute("book", book);
			return "viewBook.jsp";
		}
	}
	
	
	
	// Create
	@PostMapping("/books/new")
	public String newBook(@Valid @ModelAttribute("newBook") Book newBook, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Book> allBooks = bookService.allBooks();
			model.addAttribute("allBooks", allBooks);
			return "bookForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";	
			} else {
				User user = userService.findById(userId);
				newBook.setUser(user);
				bookService.createBook(newBook);
				return "redirect:/books";
			}
		}
	}
	
	// Random Selection:
	@GetMapping("/books/random")
	public String getRandomBook(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Book randomBook = bookService.getRandomBook(userId);
			model.addAttribute("randomBook", randomBook);
			return "randomBook.jsp";
		}
	}
	
	// Update Book:
	@GetMapping("/books/edit/{id}")
	public String editBookForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Book book = bookService.findOneBook(id);
			model.addAttribute("book", book);
			return "editBook.jsp";
		}
	}
	
	@PutMapping("/books/edit/{id}")
	public String editBook(@PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("book", book);
			return "editBook.jsp";
		} else {
			bookService.updateBook(book);
			return "redirect:/books";
		}
	}
	
	// Delete:
	@DeleteMapping("/books/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookService.deleteBook(id);
		return "redirect:/books";
	}
}
