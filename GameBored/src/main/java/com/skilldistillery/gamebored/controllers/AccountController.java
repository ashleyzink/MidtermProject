package com.skilldistillery.gamebored.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.gamebored.data.AuthenticationDAO;
import com.skilldistillery.gamebored.entities.User;


@Controller
public class AccountController {

	@Autowired
	private AuthenticationDAO aDao;
	
//LOGIN
	@RequestMapping(path="loginbutton.do", method=RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		User u = new User();
		ModelAndView mv = new ModelAndView("login", "user", u);
		return mv;
	}
	

	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView doLogin(@Valid User user, Errors errors, HttpSession session) {
//	public ModelAndView doLogin(String email, String password, Errors errors, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = aDao.getUserByEmail(user.getEmail());
//		User loggedInUser = aDao.getUserByEmail(email);
		// TODO: If the email was not found, use the Errors object to reject the email, 
		// with the message "Email not found"
		if(loggedInUser == null) {
		  errors.rejectValue("email", "error.email", "Email not found");
		}
		else {
    		// TODO: Else if the user is not valid (isValidUser), use the Errors object to reject 
  		  // the password with the message "Incorrect password"
		  boolean isValidUser = aDao.isValidUser(user.getEmail(), user.getPassword());
		  if(!isValidUser) {
		    errors.rejectValue("password", "error.password", "Incorrect password");
		  }
		}
		if (errors.getErrorCount() != 0) {
			mv.setViewName("login");
			return mv;
		}
		session.setAttribute("loggedInUser", loggedInUser);
		mv.setViewName("profilepage");
		return mv;
	}
	
	
	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public ModelAndView logoutDo(HttpSession session) {
		ModelAndView mv = new ModelAndView();

		session.removeAttribute("loggedInUser");

		mv.setViewName("login");
		return mv;
	}
	

	
	@RequestMapping(path="register.do", method=RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		// TODO: Create a user command object for use with the registration form,
		// set it in the model with the key "user",
		// and return the view 'WEB-INF/register.jsp'
		User u = new User();
		mv.addObject("user", u);
		mv.setViewName("registrationpage");
		return mv;
	}
	
	
//REGISTER
	
	// TODO: Add the @Valid annotation to the User object
	// TODO: Inject the Errors object
	@RequestMapping(path="registration.do", method=RequestMethod.POST)
	public String create(@Validated User user, Errors errors, HttpSession session) {
		// TODO: 1. If there are any errors, return the view 'WEB-INF/register.jsp'
	  if(errors.hasErrors()) {
	    return "homepage";
	  }
		// TODO: 2. Check the email's uniqueness with the DAO's isEmailUnique method
		//          if the email already exists, add an additional error (use 
	  //          errors.rejectValue()...) and return the view 'WEB-INF/register.jsp'.
	  if(!aDao.isEmailUnique(user.getEmail())) {
	    errors.rejectValue("email", "error.email", "Email already in use");
	    return "homepage";
	  }
	  
	  // TODO: 3. Add the user to the DAO
	  user.setEnabled(1);
	  user.setRole("user");
	  aDao.create(user);
	//  session.setAttribute("loggedInUser", user);
		return "login";
	}
	
	@RequestMapping(path="profilepage.do", method=RequestMethod.GET)
	public String profilePage(HttpSession session) {
		return "profilepage";
	}
	
	
}
