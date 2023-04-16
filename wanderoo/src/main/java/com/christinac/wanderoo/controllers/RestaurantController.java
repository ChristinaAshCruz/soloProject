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
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// get trip info
			Trip trip = tripServ.findById(tripId);
			model.addAttribute("trip", trip);
			Restaurant restaurant = restaurantServ.findById(restaurantId);
			model.addAttribute("restaurant", restaurant);
			if(trip.getTripMembers().size() > 1) {
				if(restaurant.getMembersAttending().contains(user)) {
					model.addAttribute("attendStatus", true);
				} else {
					model.addAttribute("attendStatus", false);
				}
			}
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
	// editRestaurant
	
	@GetMapping("/trip/{tripId}/restaurant/{restaurantId}/edit")
	public String editRestaurant(@PathVariable("tripId") Long tripId, @PathVariable("restaurantId") Long restaurantId, Model model, RedirectAttributes redirect, HttpSession session) {
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
			// get restaurant info
			Restaurant restaurant = restaurantServ.findById(restaurantId);
			String restaurantName = restaurant.getName();
			model.addAttribute("restaurant", restaurant);
			model.addAttribute("restaurantName", restaurantName);
			model.addAttribute("restaurantId", restaurantId);
			return "editRestaurant.jsp";
		}
	}
	
	@PutMapping("/trip/{tripId}/restaurant/{restaurantId}/edit")
	public String updateRestaurant(@Valid @ModelAttribute("restaurant") Restaurant restaurant, BindingResult result, @PathVariable("tripId") Long tripId, @PathVariable("restaurantId") Long restaurantId, HttpSession session, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("tripId", tripId);
			model.addAttribute("tripName", tripServ.findById(tripId).getTripName());
			// find user info
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// find activity info
			String restaurantName = restaurantServ.findById(restaurantId).getName();
			model.addAttribute("restaurantId", restaurantId);
			model.addAttribute("restaurantName", restaurantName);
			return "editActivity.jsp";
		} else {
			// remove old restaurant from tripRestaurants
			Trip trip = tripServ.findById(tripId);
			List<Restaurant> tripRestaurants = trip.getTripRestaurants();
			tripRestaurants.remove(restaurantServ.findById(restaurantId));
			// set restaurant id to current id
			restaurant.setId(restaurantId);
			// set restaurant creator to one in session
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			restaurant.setRestaurantCreator(user);
			// keep restaurant in same trip (add updated restaurant to list)
			restaurant.setTrip(trip);
			tripRestaurants.add(restaurant);
			// update restaurant in db
			restaurantServ.update(restaurant);
			// redirect back to restaurant list
			return "redirect:/trip/" + tripId + "/restaurant/" + restaurantId;
		}
	}
	
	// add member to membersAttending
	@GetMapping("/trip/{tripId}/restaurant/{restaurantId}/member-attend")
	public String memberAttendRestaurant(@PathVariable("tripId") Long tripId, @PathVariable("restaurantId") Long restaurantId, HttpSession session, RedirectAttributes redirect, Model model) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			// need to write out member attend code here...
			// need user and restaurantId
			Long userId = (Long) session.getAttribute("userId");
			restaurantServ.addMemberAttending(userId, restaurantId);
			Restaurant restaurant = restaurantServ.findById(restaurantId);
			User user = userServ.findById(userId);
			// checking if group is larger than 0 in order to show attendance button
			Trip trip = tripServ.findById(tripId);
			if(trip.getTripMembers().size() > 1) {
				if(restaurant.getMembersAttending().contains(user)) {
					model.addAttribute("attendStatus", true);
				} else {
					model.addAttribute("attendStatus", false);
				}
			}
			return "redirect:/trip/" + tripId + "/restaurant/" + restaurantId;
		}
	}
	// deleteRestaurant
	@GetMapping("/trip/{tripId}/restaurant/{restaurantId}/delete")
	public String deleteRestaurant(@PathVariable("tripId") Long tripId, @PathVariable("restaurantId") Long restaurantId, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
		restaurantServ.deleteById(restaurantId);
		return "redirect:/trip/" + tripId + "/restaurant/list";
		}
	}
}
