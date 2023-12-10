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

import com.mfrutchey.indecider.models.Restaurant;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.RestaurantService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RestaurantController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;	
	
	@Autowired
	private RestaurantService restaurantService;
	
	// Read All / Form Page
	@GetMapping("/restaurants")
	public String restaurantForm(@ModelAttribute("newRestaurant") Restaurant newRestaurant, Model model) {
		Long userId = (Long) session.getAttribute("userId");		
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Restaurant> allRestaurants = restaurantService.allRestaurants();
			model.addAttribute("allRestaurants", allRestaurants);
			return "restaurantForm.jsp";
		}
	}
	
	// Read One:
	@GetMapping("/restaurants/{id}")
	public String viewRestaurant(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Restaurant restaurant = restaurantService.findOneRestaurant(id);
			model.addAttribute("restaurant", restaurant);
			return "viewRestaurant.jsp";
		}
	}
	
	// Create
	@PostMapping("/restaunts/new")
	public String newRestaurant(@Valid @ModelAttribute("newRestaurant") Restaurant newRestaurant, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Restaurant> allRestaurants = restaurantService.allRestaurants();
			model.addAttribute("allRestaurants", allRestaurants);
			return "restaurantForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";	
			} else {			
			User user = userService.findById(userId);
			newRestaurant.setUser(user);
			restaurantService.createRestaurant(newRestaurant);
			return "redirect:/restaurants";
			}
		}
	}
	
	// Random Selection
	@GetMapping("/restaurants/random")
	public String getRandomRestaurant(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Restaurant randomRestaurant = restaurantService.getRandomRestaurant(userId);
			model.addAttribute("randomRestaurant", randomRestaurant);
			return "randomRestaurant.jsp";
		}
	}
	
	// Update Restaurant:
	@GetMapping("/restaurants/edit/{id}")
	public String editRestaurantForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Restaurant restaurant = restaurantService.findOneRestaurant(id);
			model.addAttribute("restaurant", restaurant);
			return "editRestaurant.jsp";
		}
	}
	
	@PutMapping("/restaurants/edit/{id}")
	public String editRestaurant(@PathVariable("id") Long id, @Valid @ModelAttribute("restaurant") Restaurant restaurant,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("restaurant", restaurant);
			return "editRestaurant.jsp";
		} else {
			restaurantService.updateRestaurant(restaurant);
			return "redirect:/restaurants";
		}
	}
	
	// Delete Restaurant:
	@DeleteMapping("/restaurants/delete/{id}")
	public String deleteRandomItem(@PathVariable("id") Long id) {
		restaurantService.deleteRestaurant(id);
		return "redirect:/restaurants";
	}
	
}
