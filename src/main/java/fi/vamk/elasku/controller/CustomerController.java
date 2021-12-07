package fi.vamk.elasku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import fi.vamk.elasku.model.Customer;
import fi.vamk.elasku.model.User;
import fi.vamk.elasku.repository.CustomerRepository;
import fi.vamk.elasku.repository.UserRepository;

@Controller
@SessionAttributes("user")
public class CustomerController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
    UserRepository userRepository;
    @Autowired
    CustomerRepository customerRepository;
    
    @RequestMapping(value="/app/customers", method = RequestMethod.GET)
    public String customerAction( ModelMap model,    	
    	@SessionAttribute User user,
    	@RequestParam(value = "action", required = false, defaultValue = "view") String action,
    	@RequestParam(value = "id", required = false, defaultValue = "0") int id) {

		List<Customer> customers = customerRepository.findByUserEmail(user.getUserEmail());
    	model.put("customers", customers);   
    	
    	if(action.equals("delete")) {
    		Customer customerToDelete = customers.get(id);
    		customerRepository.delete(customerToDelete);
    		logger.info("ID = " + id + " has been deleted!");
    		return "redirect:customers";
    	} 
     
        return "customers";
    }
    
    @RequestMapping(value="/app/customer/new", method = RequestMethod.GET)
    public String customerCreate( ModelMap model,    	
    	@SessionAttribute User user) {
     
        return "customerCreate";
    }
    
    
    @RequestMapping(value="/app/customer/new", method = RequestMethod.POST)
    public String customerNew( ModelMap model,    	
    	@SessionAttribute User user,
    	@ModelAttribute Customer customer) {
    	
    	List<Customer> customers = customerRepository.findByUserEmail(user.getUserEmail());
    	
    	// Check if current customer are already added by same user
    	for(Customer c : customers) {
    		if(c.getCustomerEmail().equals(customer.getCustomerEmail()) && c.getUserEmail().equals(user.getUserEmail())) {
    			model.put("error", "Customer already exist!");
    			return "customerCreate";
    		}
    	}
    	
    	customer.setUserEmail(user.getUserEmail());
        customerRepository.save(customer);
    	logger.info("New customer added: " + customer.getCustomerName());
        return "redirect:/app/customers";
    }
    
}