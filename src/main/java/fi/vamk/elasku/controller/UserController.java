package fi.vamk.elasku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import fi.vamk.elasku.model.User;
import fi.vamk.elasku.repository.UserRepository;

@Controller
@SessionAttributes("user")
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
    UserRepository userRepository;
    
    @RequestMapping(value="/register", method = RequestMethod.GET)
    public String startInsert( ModelMap model) {       
        return "register";
    }
    

    @RequestMapping(value="/register", method=RequestMethod.POST) 
    public String register(ModelMap model, @RequestParam String username, @RequestParam String name, @RequestParam String passwordOne, @RequestParam String passwordTwo) {

    	try {
            if (username.trim().isEmpty() || name.trim().isEmpty() || passwordOne.trim().isEmpty() || passwordTwo.trim().isEmpty()) {
            	model.put("error", "Fill in all fields!");
            } else {
            	if(!userRepository.existsById(username)) { //Check if user not exist
	            	if(passwordOne.equals(passwordTwo)) {
	            		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	            		String cryptedPassword = passwordEncoder.encode(passwordOne);
	            		
	            		User user = new User(username, name, cryptedPassword);

	                    userRepository.save(user);
	                    
	                    logger.info("New user registered: " + user.getUserEmail());
	                    return "redirect:/app";
	                   
	            	} else {
	            		model.put("error", "Password don't match!");
	            	}
	            } else {
	            	model.put("error", "Username already exist!");
	            }
            }
        } catch (Exception e) {
        	model.put("error", "Something went wrong, try again later!");
        	System.out.println(e.toString());
        }
    	
        return "register"; //Return here if errors      
    }

    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String adminlogin(ModelMap model, SessionStatus status,
	    @RequestParam(value = "error", required = false) String error,
	    @RequestParam(value = "logout", required = false) String logout) {
    	
	    if (error != null) {
	    	model.put("error", "Wrong email or password!");
	    }
	    
	    if (logout != null) {
	    	model.remove("user");
	        status.setComplete();
	    	model.put("note", "You have logged out!");
	    }
	    
	    return "login";
    }
    
    /* For authentication */
    @RequestMapping(value = "/Testrole", method = RequestMethod.GET)
    public String choosePage(ModelMap model) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    User user = userRepository.getById(auth.getName());
	    logger.info("role " + user.getRolename());
	    model.put("user", user);
	    
	    if (user.getRolename().equals("ROLE_USER")) {
	    	return "redirect:/app";
	    } else if (user.getRolename().equals("ROLE_ADMIN")) {
	    	return "redirect:/app";
	    } else {
	    	return "redirect:/app";
	    }
	}
    
    /* Profile page */
    @RequestMapping(value = "/app/profile", method = RequestMethod.GET)
    public String profilePage(ModelMap model) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    User user = userRepository.getById(auth.getName());

	    model.put("param", user);
	    
	    return "profile";
	}
    
    /* Profile page, save changes */
    @RequestMapping(value = "/app/profile", method = RequestMethod.POST)
    public String profilePageEdit(ModelMap model,
    	@ModelAttribute User user) {

    	userRepository.save(user);
    	logger.info("Profile updated");
	    
	    return "redirect:/app/profile";
	}
}