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

import com.mfrutchey.indecider.models.Show;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.ShowService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ShowController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ShowService showService;
	
	
	// Read All / Form Page
	@GetMapping("/shows")
	public String showForm(@ModelAttribute("newShow") Show newShow, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Show> allShows = showService.allShows();
			model.addAttribute("allShows", allShows);
			return "showForm.jsp";
		}
	}
	
	// Read One:
	@GetMapping("/shows/{id}")
	public String viewShow(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Show show = showService.findOneShow(id);
			model.addAttribute("show", show);
			return "viewShow.jsp";
		}
	}
	
	// Create
	@PostMapping("/shows/new")
	public String newShow(@Valid @ModelAttribute("newShow") Show newShow, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Show> allShows = showService.allShows();
			model.addAttribute("allShows", allShows);
			return "showForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";	
			} else {
			User user = userService.findById(userId);
			newShow.setUser(user);
			showService.createShow(newShow);
			return "redirect:/shows";
			}
		}
	}
	
	
	// Random Selection
	@GetMapping("/shows/random")
	public String getRandomShow(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Show randomShow = showService.getRandomShow(userId);
			model.addAttribute("randomShow", randomShow);
			return "randomShow.jsp";
		}
	}
	
	// Update Show:
	@GetMapping("/shows/edit/{id}")
	public String editShowForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Show show = showService.findOneShow(id);
			model.addAttribute("show", show);
			return "editShow.jsp";			
		}
	}
	
	@PutMapping("/shows/edit/{id}")
	public String editShow(@PathVariable("id") Long id, @Valid @ModelAttribute("show") Show show, 
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("show", show);
			return "editShow.jsp";
		} else {
			showService.updateShow(show);
			return "redirect:/shows";
		}
	}
	
	// Delete
	@DeleteMapping("/shows/delete/{id}")
	public String deleteShow(@PathVariable("id") Long id) {
		showService.deleteShow(id);
		return "redirect:/shows";
	}
}
