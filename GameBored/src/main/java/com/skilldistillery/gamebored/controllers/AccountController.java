package com.skilldistillery.gamebored.controllers;

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
//	@RequestMapping(path="login", method=RequestMethod.GET)
//	public ModelAndView login() {
//		User u = new User();
//		ModelAndView mv = new ModelAndView("WEB-INF/login.jsp", "user", u);
//		return mv;
//	}
//	

	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public ModelAndView doLogin(@Validated User user, Errors errors) {
		ModelAndView mv = new ModelAndView();
		
		User loggedInUser = aDao.getUserByEmail(user.getEmail());
		// TODO: If the email was not found, use the Errors object to reject the email, 
		// with the message "Email not found"
		if(loggedInUser == null) {
		  errors.rejectValue("email", "error.email", "Email not found");
		}
		else {
    		// TODO: Else if the user is not valid (isValidUser), use the Errors object to reject 
  		  // the password with the message "Incorrect password"
		  boolean isValidUser = aDao.isValidUser(user);
		  if(!isValidUser) {
		    errors.rejectValue("password", "error.password", "Incorrect password");
		  }
		}
		if (errors.getErrorCount() != 0) {
			mv.setViewName("WEB-INF/login.jsp");
			return mv;
		}
		mv.addObject("user", loggedInUser);
		mv.setViewName("WEB-INF/profile.jsp");
		return mv;
	}
	
	
//	
//	@RequestMapping(path="register.do", method=RequestMethod.GET)
//	public ModelAndView register() {
//		ModelAndView mv = new ModelAndView();
//		// TODO: Create a user command object for use with the registration form,
//		// set it in the model with the key "user",
//		// and return the view 'WEB-INF/register.jsp'
//		User u = new User();
//		mv.addObject("user", u);
//		mv.setViewName("WEB-INF/register.jsp");
//		return mv;
//	}
	
	
//REGISTER
	
	// TODO: Add the @Valid annotation to the User object
	// TODO: Inject the Errors object
	@RequestMapping(path="register.do", method=RequestMethod.POST)
	public String create(@Validated User user, Errors errors) {
		// TODO: 1. If there are any errors, return the view 'WEB-INF/register.jsp'
	  if(errors.hasErrors()) {
	    return "WEB-INF/register.jsp";
	  }
		// TODO: 2. Check the email's uniqueness with the DAO's isEmailUnique method
		//          if the email already exists, add an additional error (use 
	  //          errors.rejectValue()...) and return the view 'WEB-INF/register.jsp'.
	  if(!aDao.isEmailUnique(user.getEmail())) {
	    errors.rejectValue("email", "error.email", "Email already in use");
	    return "WEB-INF/register.jsp";
	  }
	  
	  // TODO: 3. Add the user to the DAO
	  aDao.create(user);
	  
		return "WEB-INF/profile.jsp";
	}
	
	
}
