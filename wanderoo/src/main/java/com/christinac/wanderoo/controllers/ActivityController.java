package com.christinac.wanderoo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.UserService;

@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	private UserService userServ;
	
	@GetMapping("/list/1")
	public String viewActivityList(Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			return "viewActivityList.jsp";
		}
	}
	
	// functions to add:
		// viewActivity
		// createActivity
		// deleteActivity
		// editActivty
}