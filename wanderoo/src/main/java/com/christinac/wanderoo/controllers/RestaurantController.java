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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.christinac.wanderoo.models.Restaurant;
import com.christinac.wanderoo.models.Trip;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.RestaurantService;
import com.christinac.wanderoo.services.TripService;
import com.christinac.wanderoo.services.UserService;

@Controller
public class RestaurantController {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private TripService tripServ;
	@Autowired
	private RestaurantService restaurantServ;
	
	@GetMapping("/trip/{tripId}/restaurant/list")
	public String viewRestaurantList(@PathVariable("tripId") Long tripId, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			// finding session's user info
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			// finding trip info
			Trip trip = tripServ.findById(tripId);
			Integer listSize = trip.getTripRestaurants().size();
			model.addAttribute("trip", trip);
			model.addAttribute("listSize", listSize);
			return "viewRestaurantList.jsp";
		}
	}
// functions to add: 
	// viewRestaurant
	@GetMapping("/trip/{tripId}/restaurant/{restaurantId}")
	public String viewRestaurant(@PathVariable("tripId") Long tripId, @PathVariable("restaurantId") Long restaurantId, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			// get user info
			Long userId = (Long) session.getAttribute("userId");
			User loggedUser = userServ.findById(userId);
			model.addAttribute("user", loggedUser);
			// get trip info
			Trip trip = tripServ.findById(tripId);
			model.addAttribute("trip", trip);
			Restaurant restaurant = restaurantServ.findById(restaurantId);
			model.addAttribute("restaurant", restaurant);
			return "viewRestaurant.jsp";
		}
	}
	// createRestaurant
	@GetMapping("/trip/{tripId}/restaurant/new")
	public String newRestaurant(@ModelAttribute("newRestaurant") Restaurant restaurant, @PathVariable("tripId") Long tripId, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			// finding session's user info
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// finding trip info
			Trip trip = tripServ.findById(tripId);
			String tripName = trip.getTripName();
			model.addAttribute("tripName", tripName);
			model.addAttribute("tripId", tripId);
			return "newRestaurant.jsp";
		}
	}
	
	@PostMapping("/trip/{tripId}/restaurant/new")
	public String createRestaurant(@Valid @ModelAttribute("newRestaurant") Restaurant restaurant, BindingResult result, HttpSession session, Model model, @PathVariable("tripId") Long tripId) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			Trip trip = tripServ.findById(tripId);
			String tripName = trip.getTripName();
			model.addAttribute("tripName", tripName);
			model.addAttribute("tripId", tripId);
			return "newRestaurant.jsp";
		} 
		// set restaurant creator to user creator
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		restaurant.setRestaurantCreator(user);
		// set restaurant trip to current trip
		Trip trip = tripServ.findById(tripId);
		restaurant.setTrip(trip);
		// add restaurant to trip's list -> tripRestaurants
		List<Restaurant> tripRestaurants = trip.getTripRestaurants();
		tripRestaurants.add(restaurant);
		// save restaurant in db
		restaurantServ.create(restaurant);
		return "redirect:/trip/" + tripId +"/restaurant/list";
	}
	// deleteRestaurant
	// editRestaurant
}
