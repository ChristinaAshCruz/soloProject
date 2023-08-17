package com.christinac.wanderoo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christinac.wanderoo.models.LoginUser;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userServ;
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		session.setAttribute("userId", null);
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		User user = userServ.register(newUser, result);
		if(user == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		} else { 
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		}
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser loginUser, BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(loginUser, result);
		if(user == null) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		} else {
			session.setAttribute("userId", user.getId());
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			return "dashboard.jsp";
		}
	}
	
	@GetMapping("/about")
	public String about(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
		return "about.jsp";
	}
	
	
	@GetMapping("/temp")
	public String temp(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		model.addAttribute("user", user);
		return "temp.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session,  RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			session.setAttribute("userId", null);
			return "redirect:/";
		}
	}
}
