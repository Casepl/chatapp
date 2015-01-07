package com.springapp.mvc;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class UserController {
	@Autowired
	private UserRepository userRepository;
	//private UserRepositoryImpl userRepositoryImpl = new UserRepositoryImpl();
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		model.addAttribute("user", new User());
		model.addAttribute("users", userRepository.findAll());
		//model.addAttribute("users", userRepositoryImpl.findAllCustom());
		return "users";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public
	@ResponseBody
	ResponseEntity<String> addUser(@ModelAttribute("user") User user, BindingResult result) throws JSONException {

		userRepository.save(user);
		JSONObject userJSON = new JSONObject();
		userJSON.put("firstName", user.getFirstName());
		userJSON.put("lastName", user.getLastName());
		return new ResponseEntity<String>(userJSON.toString(),HttpStatus.OK);
	}

	@RequestMapping("/delete/{userId}")
	public String deleteUser(@PathVariable("userId") Long userId) {

		userRepository.delete(userRepository.findOne(userId));

		return "redirect:/";
	}

	@RequestMapping(value = "/api/users", method = RequestMethod.GET)
	public
	@ResponseBody
	String listUsersJson(ModelMap model) throws JSONException {
		JSONArray userArray = new JSONArray();
		for (User user : userRepository.findAll()) {
				JSONObject userJSON = new JSONObject();
				userJSON.put("id", user.getId());
				userJSON.put("firstName", user.getFirstName());
				userJSON.put("lastName", user.getLastName());
				userJSON.put("email", user.getEmail());
				userArray.put(userJSON);

		}
		return userArray.toString();
	}
}