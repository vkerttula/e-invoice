package fi.vamk.elasku.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AppController {

    @RequestMapping(value={"/"}, method = RequestMethod.GET)
    public String landingPage( ModelMap model ) {
		
        return "landing";
        
    }
    
    @RequestMapping(value={"/app"}, method = RequestMethod.GET)
    public String frontPage( ModelMap model ) {
		
        return "app";
        
    } 
    
}