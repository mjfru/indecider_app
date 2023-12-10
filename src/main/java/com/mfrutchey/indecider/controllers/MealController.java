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

import com.mfrutchey.indecider.models.Meal;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.MealService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MealController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MealService mealService;
	
	// Read All / Form Page:
	@GetMapping("/meals")
	public String mealForm(@ModelAttribute("newMeal") Meal newMeal, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			String[] courses = {"Breakfast", "Brunch", "Lunch", "Dinner", "Side Dish", "Snack", "Other"};
			model.addAttribute("courses", courses);
			List<Meal> allMeals = mealService.allMeals();
			model.addAttribute("allMeals", allMeals);
			return "mealForm.jsp";
		}
	}
	
	// Read One:
	@GetMapping("/meals/{id}")
	public String viewMeal(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Meal meal = mealService.findOneMeal(id);
			model.addAttribute("meal", meal);
			return "viewMeal.jsp";
		}
	}
	
	// Create:
	@PostMapping("/meals/new")
	public String newMeal(@Valid @ModelAttribute("newMeal") Meal newMeal, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Meal> allMeals = mealService.allMeals();
			model.addAttribute("allMeals", allMeals);
			String[] courses = {"Breakfast", "Brunch", "Lunch", "Dinner", "Side Dish", "Snack", "Other"};
			model.addAttribute("courses", courses);
			return "mealForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";
			} else {
				User user = userService.findById(userId);
				newMeal.setUser(user);
				mealService.createMeal(newMeal);
				return "redirect:/meals";
			}
		}
	}
	
	// Random Selection
	@GetMapping("/meals/random")
	public String getRandomMeal(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Meal randomMeal = mealService.getRandomMeal(userId);
			model.addAttribute("randomMeal", randomMeal);
			String[] courses = {"Breakfast", "Brunch", "Lunch", "Dinner", "Side Dish", "Snack", "Other"};
			model.addAttribute("courses", courses);
			return "randomMeal.jsp";
		}
	}
	
	// Update Meal:
	@GetMapping("/meals/edit/{id}")
	public String editMealForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Meal meal = mealService.findOneMeal(id);
			model.addAttribute("meal", meal);
			String[] courses = {"Breakfast", "Brunch", "Lunch", "Dinner", "Side Dish", "Snack", "Other"};
			model.addAttribute("courses", courses);
			return "editMeal.jsp";
		}
	}
	
	@PutMapping("/meals/edit/{id}")
	public String editMeal(@PathVariable("id") Long id, @Valid @ModelAttribute("meal") Meal meal,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("meal", meal);
			String[] courses = {"Breakfast", "Brunch", "Lunch", "Dinner", "Side Dish", "Snack", "Other"};
			model.addAttribute("courses", courses);			
			return "editMeal.jsp";
		} else {
			mealService.updateMeal(meal);
			return "redirect:/meals";
		}
	}
	
	// Delete Meal:
	@DeleteMapping("/meals/delete/{id}")
	public String deleteMeal(@PathVariable("id") Long id) {
		mealService.deleteMeal(id);
		return "redirect:/meals";
	}
}
