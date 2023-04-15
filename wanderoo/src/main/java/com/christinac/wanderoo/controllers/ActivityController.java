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
			Integer listSize = trip.getTripActivities().size();
			model.addAttribute("listSize", listSize);
			model.addAttribute("trip", trip);
			return "viewActivityList.jsp";
		}
	}
	
	// functions to add:
		// viewActivity
	@GetMapping("/trip/{tripId}/activity/{activityId}")
	public String viewActivity(@PathVariable("tripId") Long tripId, @PathVariable("activityId") Long activityId, Model model, HttpSession session, RedirectAttributes redirect) {
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
			Activity activity = activityServ.findById(activityId);
			model.addAttribute("activity", activity);
			// checking if trip is a solo or group trip
			if(trip.getTripMembers().size() > 1) {
				if(activity.getMembersAttending().contains(user)) {
					model.addAttribute("attendStatus", true);
				} else {
					model.addAttribute("attendStatus", false);
				}
			}
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
	
	@GetMapping("/trip/{tripId}/activity/{activityId}/edit")
	public String editActivity(@PathVariable("tripId") Long tripId, @PathVariable("activityId") Long activityId, Model model, HttpSession session, RedirectAttributes redirect) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in!");
			return "redirect:/";
		} else {
			// find trip info
			Trip trip = tripServ.findById(tripId);
			model.addAttribute("trip", trip);
			model.addAttribute("tripId", tripId);
			model.addAttribute("tripName", trip.getTripName());
			// find user info
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// find activity info
			Activity activity =  activityServ.findById(activityId);
			String activityName = activity.getName();
			model.addAttribute("activity", activity);
			model.addAttribute("activityId", activityId);
			model.addAttribute("activityName", activityName);
			return "editActivity.jsp";
		}
	}
	
	@PutMapping("/trip/{tripId}/activity/{activityId}/edit")
	public String updateActivity(@Valid @ModelAttribute("activity") Activity activity, BindingResult result, @PathVariable("tripId") Long tripId, @PathVariable("activityId") Long activityId, HttpSession session, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("tripId", tripId);
			model.addAttribute("tripName", tripServ.findById(tripId).getTripName());
			// find user info
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			model.addAttribute("user", user);
			// find activity info
			String activityName = activityServ.findById(activityId).getName();
			model.addAttribute("activityId", activityId);
			model.addAttribute("activityName", activityName);
			return "editActivity.jsp";
		} else {
			// replacing current id with updated info
			activity.setId(activityId);
			// keep activity creator the same
			Long userId = (Long) session.getAttribute("userId");
			User user = userServ.findById(userId);
			activity.setActivityCreator(user);
			// keep trip that it belongs to
			Trip trip = tripServ.findById(tripId);
			activity.setTrip(trip);
			// remove activity from trip list
			List<Activity> tripActivities = trip.getTripActivities();
			tripActivities.remove(activityServ.findById(activityId));
			// adding updated activity to list
			tripActivities.add(activity);
			// update activity
			activityServ.update(activity);
			return "redirect:/trip/" + tripId +"/activity/" + activityId;
		}
	}
		// deleteActivity
		// editActivty
	// add members to attendance
	@GetMapping("/trip/{tripId}/activity/{activityId}/member-attend")
	public String memberAttendActivity(@PathVariable("tripId") Long tripId, @PathVariable("activityId") Long activityId, HttpSession session, RedirectAttributes redirect, Model model) {
		if(session.getAttribute("userId") == null) {
			redirect.addFlashAttribute("error", "You must be logged in to access Wanderoo 😢");
			return "redirect:/";
		} else {
			// need to write out member attend code here...
			// need user and activityId
			Long userId = (Long) session.getAttribute("userId");
			activityServ.addMemberAttending(userId, activityId);
			Activity activity = activityServ.findById(activityId);
			User user = userServ.findById(userId);
			Trip trip = tripServ.findById(tripId);
			if(trip.getTripMembers().size() > 1) {
				if(activity.getMembersAttending().contains(user)) {
					model.addAttribute("attendStatus", true);
				} else {
					model.addAttribute("attendStatus", false);
				}
			}
			return "redirect:/trip/" + tripId + "/activity/" + activityId;
		}
	}
	
}
