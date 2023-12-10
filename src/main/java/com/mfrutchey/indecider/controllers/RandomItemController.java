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

import com.mfrutchey.indecider.models.RandomItem;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.RandomItemService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class RandomItemController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RandomItemService randomItemService;
	
	
	// Read All / Form Page
	@GetMapping("/random")
	public String randomForm(@ModelAttribute("newRandomItem") RandomItem randomItem, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<RandomItem> allRandomItems = randomItemService.allRandomItems();
			model.addAttribute("allRandomItems", allRandomItems);
			return "randomItemForm.jsp";
		}
	}
	
	// Create
	@PostMapping("/random/new")
	public String newRandomItem(@Valid @ModelAttribute("newRandomItem") RandomItem newRandomItem, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<RandomItem> allRandomItems = randomItemService.allRandomItems();
			model.addAttribute("allRandomItems", allRandomItems);
			return "randomItemForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";
			} else {
				User user = userService.findById(userId);
				newRandomItem.setUser(user);
				randomItemService.createRandomItem(newRandomItem);
				return "redirect:/random";
			}
		} 
	}
	
	// Random Selection
	@GetMapping("/random/random")
	public String getRandomItem(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);			
			RandomItem randomRandomItem = randomItemService.getRandomRandomItem(userId);
			// System.out.println("Random RandomItem: " + randomRandomItem);
			model.addAttribute("randomRandomItem", randomRandomItem);
			return "randomItem.jsp";
		}
	}
	
	
	// Delete Item
	@DeleteMapping("/random/delete/{id}")
	public String deleteRandomItem(@PathVariable("id") Long id) {
		randomItemService.deleteRandomItem(id);
		return "redirect:/random";
	}
}













