package com.mfrutchey.indecider.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mfrutchey.indecider.models.LoginUser;
import com.mfrutchey.indecider.models.User;
import com.mfrutchey.indecider.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

	@Autowired 
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	// Login & Registration Routes:
	@GetMapping("/")
	public String loginRegister(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "log_reg.jsp";
	}
	
	// Home page / Dashboard:
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			User user = userService.findById(userId);
			model.addAttribute("user", user);
			return "dashboard.jsp";
		}
	}
	
	// About page from the login / registration page:
	@GetMapping("/about")
	public String aboutPage() {
		return "loginAbout.jsp";
	}
	
	// About page from the dashboard:
	@GetMapping("/aboutHome")
	public String aboutPageHome() {
		Long userId = (Long) session.getAttribute("userId");
		if (userId == null) {
			return "redirect:/";
		} else {
			return "about.jsp";
		}
	}
	
	// Registering a new user:
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model) {
		userService.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "log_reg.jsp";
		} else {
			session.setAttribute("userId", newUser.getId());
			return "redirect:/dashboard";
			// Change to a redirect later
		}
	}
	
	// Logging a user in:
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model) {
		User user = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "log_reg.jsp";
		} else {
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		}
	}
	
	// Logging a user out:
	@GetMapping("/logout")
	public String logout() {
		session.setAttribute("userId", null);
		return "redirect:/";
	}
}
