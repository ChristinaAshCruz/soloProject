package com.christinac.wanderoo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christinac.wanderoo.models.Trip;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.TripService;
import com.christinac.wanderoo.services.UserService;

@Controller
public class ActivityController {

	@Autowired
	private UserService userServ;
	@Autowired
	private TripService tripServ;
	
	@GetMapping("/trip/{tripId}/activitiy/list")
	public String viewActivityList(@PathVariable("tripId") Long tripId, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			Trip trip = tripServ.findById(tripId);
			model.addAttribute("trip", trip);
			return "viewActivityList.jsp";
		}
	}
	
	// functions to add:
		// viewActivity
		// createActivity
		// deleteActivity
		// editActivty
}
