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

import com.mfrutchey.indecider.models.Game;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.GameService;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class GameController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GameService gameService;
	
	// Read All / Form Page
	@GetMapping("/games")
	public String gameForm(@ModelAttribute("newGame") Game newGame, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			String[] platforms = {"PS5", "Xbox Series X/S", "PC", "Switch", "Other/Retro Console"};
			model.addAttribute("platforms", platforms);
			List<Game> allGames = gameService.allGames();
			model.addAttribute("allGames", allGames);
			return "gameForm.jsp";
		}
	}
	
	// Read One:
	@GetMapping("/games/{id}")
	public String viewGame(@PathVariable("id") Long id, Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";	
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Game game = gameService.findOneGame(id);
			model.addAttribute("game", game);
			return "viewGame.jsp";
		}
	}
	
	// Create
	@PostMapping("/games/new")
	public String newGame(@Valid @ModelAttribute("newGame") Game newGame, BindingResult result, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");	//!!! Add this to other forms to keep the user's name on the page if there are errors
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			List<Game> allGames = gameService.allGames();			
			model.addAttribute("allGames", allGames);
			String[] platforms = {"PS5", "Xbox Series X/S", "PC", "Switch", "Other/Retro Console"};
			model.addAttribute("platforms", platforms);
			return "gameForm.jsp";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			if (userId == null) {
				return "redirect:/";
			} else {
				User user = userService.findById(userId);
				newGame.setUser(user);
				gameService.createGame(newGame);
				return "redirect:/games";
			}
		}
	}
	
	// Random Selection
	@GetMapping("/games/random")
	public String getRandomGame(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			Game randomGame = gameService.getRandomGame(userId);
			model.addAttribute("randomGame", randomGame);
			String[] platforms = {"PS5", "Xbox Series X/S", "PC", "Switch", "Other/Retro Console"};
			model.addAttribute("platforms", platforms);
			return "randomGame.jsp";
		}
	}
	
	// Update Game
	@GetMapping("/games/edit/{id}")
	public String editGameForm(Model model, @PathVariable("id") Long id) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			Game game = gameService.findOneGame(id);
			model.addAttribute("game", game);
			String[] platforms = {"PS5", "Xbox Series X/S", "PC", "Switch", "Other/Retro Console"};
			model.addAttribute("platforms", platforms);
			return "editGame.jsp";
		}
	}
	
	@PutMapping("/games/edit/{id}")
	public String editGame(@PathVariable("id") Long id, @Valid @ModelAttribute("game") Game game,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("game", game);
			String[] platforms = {"PS5", "Xbox Series X/S", "PC", "Switch", "Other/Retro Console"};
			model.addAttribute("platforms", platforms);
			return "editGame.jsp";
		} else {
			gameService.updateGame(game);
			return "redirect:/games";
		}
	}
	
	// Delete Game
	@DeleteMapping("/games/delete/{id}")
	public String deleteGame(@PathVariable("id") Long id) {
		gameService.deleteGame(id);
		return "redirect:/games";
	}
}
