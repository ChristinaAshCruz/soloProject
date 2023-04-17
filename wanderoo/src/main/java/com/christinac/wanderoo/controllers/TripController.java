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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
			List<User> allUsers = userServ.findAll();
			model.addAttribute("allUsers", allUsers);
			Integer tripMemberSize = trip.getTripMembers().size();
			model.addAttribute("tripMemberSize", tripMemberSize);
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
			return "newTrip.jsp";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		List<Trip> userTrips = user.getTripsCreated();
		// add trip to User's trips
		userTrips.add(trip);
		// set Trip creator to user
		trip.setTripCreator(user);
		// and then create trip + save in db
		user.getTripsAttending().add(trip);
		tripServ.create(trip);
		userServ.update(user);
		return "redirect:/dashboard";
	}
		// editTrip
	// path variable(for id) + model(for current user and trip name) + session(get current user) + RedirectAttributes(user has to be logged in)
	@GetMapping("/{id}/edit")
	public String editTrip(@PathVariable("id") Long id, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in!");
			return "redirect:/";
		} else {
			Trip trip = tripServ.findById(id);
			model.addAttribute("trip", trip);
			model.addAttribute("tripId", id);
			model.addAttribute("tripName", tripServ.findById(id).getTripName());
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			return "editTrip.jsp";
		}
	}
	
	@PutMapping("/{id}/update")
	public String updateTrip(@Valid @ModelAttribute("trip") Trip trip, BindingResult result, @PathVariable("id") Long id, HttpSession session, Model model) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			model.addAttribute("tripName", tripServ.findById(id).getTripName());
			model.addAttribute("tripId", id);
			return "editTrip.jsp";
		} else {
//			keep trip id the same
			trip.setId(id);
			// keep creator the same
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			trip.setTripCreator(user);
//			keep same members for trip
			Trip originalTrip = tripServ.findById(id);
			List<User> tripMembers = originalTrip.getTripMembers();
			trip.setTripMembers(tripMembers);
			tripServ.update(trip);
			return "redirect:/trip/" + id;
		}
	}
	@PostMapping("/{tripId}/add-members")
	public String addMember(@RequestParam(value="userId") Long userId, @PathVariable("tripId") Long tripId) {
		Trip trip = tripServ.findById(tripId);
//		Category category = categoryService.findById(id);
		User user = userServ.findById(userId);
//		Product product = productService.findById(productId);
		trip.getTripMembers().add(user);
//		category.getProducts().add(product);
		tripServ.update(trip);
		return "redirect:/trip/" + tripId;
	}
	// deleteTrip
	@GetMapping("/{tripId}/delete")
	public String deleteTrip(@PathVariable("tripId") Long tripId, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in!");
			return "redirect:/";
		} else {
		tripServ.deleteById(tripId);
		return "redirect:/dashboard";
		}
	}
}
