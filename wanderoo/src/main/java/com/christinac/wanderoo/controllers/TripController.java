package com.christinac.wanderoo.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christinac.wanderoo.models.Trip;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.TripService;
import com.christinac.wanderoo.services.UserService;

@Controller
@RequestMapping("/trip")
public class TripController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private TripService tripServ;
	
	@GetMapping("/{id}")
	public String viewTrip(@PathVariable("id") Long id, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			Trip trip = tripServ.findById(id);
			model.addAttribute("trip", trip);
			return "viewTrip.jsp";
		}
	}
	
	// functions to add:
		// createTrip
	@GetMapping("/new")
	public String newTrip(@ModelAttribute("newTrip") Trip trip, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			return "newTrip.jsp";
		}
	}
	
	@PostMapping("/new")
	public String createTrip(@Valid @ModelAttribute("newTrip") Trip trip, BindingResult result, HttpSession session, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			return "newTable.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		List<Trip> userTrips = user.getTripsCreated();
		// add trip to User's trips
		userTrips.add(trip);
		// set Trip creator to user
		trip.setTripCreator(user);
		// and then create trip + save in db
		tripServ.create(trip);
		return "redirect:/dashboard";
	}
		// editTrip
		// deleteTrip
}
