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

import com.christinac.wanderoo.models.Activity;
import com.christinac.wanderoo.models.Restaurant;
import com.christinac.wanderoo.models.Trip;
import com.christinac.wanderoo.models.User;
import com.christinac.wanderoo.services.ActivityService;
import com.christinac.wanderoo.services.TripService;
import com.christinac.wanderoo.services.UserService;

@Controller
public class ActivityController {

	@Autowired
	private UserService userServ;
	@Autowired
	private TripService tripServ;
	@Autowired
	private ActivityService activityServ;
	
	@GetMapping("/trip/{tripId}/activity/list")
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
	@GetMapping("/trip/{tripId}/activity/{activitiyId}")
	public String viewActivity(@PathVariable("tripId") Long tripId, @PathVariable("activitiyId") Long activitiyId, Model model, HttpSession session, RedirectAttributes redirect) {
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
			Activity activity = activityServ.findById(activitiyId);
			model.addAttribute("activity", activity);
			return "viewActivity.jsp";
		}
	}
	
		// createActivity
	@GetMapping("/trip/{tripId}/activity/new")
	public String newActivity(@ModelAttribute("newActivity") Activity activity, @PathVariable("tripId") Long tripId, Model model, HttpSession session, RedirectAttributes redirect) {
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
			return "newActivity.jsp";
		}
	}
	
	@PostMapping("/trip/{tripId}/activity/new")
	public String createActivity(@Valid @ModelAttribute("newActivity") Activity activity, BindingResult result, HttpSession session, Model model, @PathVariable("tripId") Long tripId) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// finding trip info
			Trip trip = tripServ.findById(tripId);
			String tripName = trip.getTripName();
			model.addAttribute("tripName", tripName);
			model.addAttribute("tripId", tripId);
			return "newActivity.jsp";
		} 
		// set restaurant creator to user creator
		Long userId = (Long) session.getAttribute("userId");
		User user = userServ.findById(userId);
		activity.setActivityCreator(user);
		// set restaurant trip to current trip
		Trip trip = tripServ.findById(tripId);
		activity.setTrip(trip);
		// add restaurant to trip's list -> tripRestaurants
		List<Activity> tripActivities = trip.getTripActivities();
		tripActivities.add(activity);
		// save restaurant in db
		activityServ.create(activity);
		return "redirect:/trip/" + tripId +"/activity/list";
	}
	
		// deleteActivity
		// editActivty
}
