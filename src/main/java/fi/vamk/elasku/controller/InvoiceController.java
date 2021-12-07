package fi.vamk.elasku.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import fi.vamk.elasku.model.Customer;
import fi.vamk.elasku.model.Defination;
import fi.vamk.elasku.model.Invoice;
import fi.vamk.elasku.model.User;
import fi.vamk.elasku.repository.CustomerRepository;
import fi.vamk.elasku.repository.DefinationRepository;
import fi.vamk.elasku.repository.UserRepository;
import fi.vamk.elasku.repository.InvoiceRepository;

@Controller
@SessionAttributes({"user", "invoices", "viewInvoice", "customer"})
public class InvoiceController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
    UserRepository userRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    InvoiceRepository invoiceRepository;
    @Autowired
    DefinationRepository definationRepository;
    
    @RequestMapping(value="/app/invoices", method = RequestMethod.GET)
    public String invoiceAction( ModelMap model,    	
    	@SessionAttribute User user) {

		List<Invoice> invoices = invoiceRepository.findByUserUserEmail(user.getUserEmail());

    	model.put("invoices", invoices);   
     
        return "invoices";
    }
    
    /* View invoice */
    @RequestMapping(value="/app/invoice/view", method = RequestMethod.GET)
    public String invoiceView( ModelMap model,    	
    	@SessionAttribute User user,
    	@SessionAttribute List<Invoice> invoices,
    	@SessionAttribute(required = false) Invoice viewInvoice,
    	@SessionAttribute(required = false) Customer customer,
    	@RequestParam(value = "id", required = false, defaultValue = "0") int id) {
    	
    	if(viewInvoice != null) {
    		// Delete old invoice if exist
        	model.remove("oldInvoice");
    	}
    	if(customer != null) {
    		// Delete old customer if exist
        	model.remove("customer");
    	}
    	
    	logger.info("ID:" + id);
    	
    	Invoice invoice = invoices.get(id);
    	Customer newCustomer = customerRepository.findByCustomerEmail(invoice.getCustomerEmail());
    	
    	model.put("viewInvoice", invoice);
    	model.put("customer", newCustomer); 
    	
        return "invoice";
    }
    
    /* Edit invoice */
    @RequestMapping(value = "/app/invoice/view", method = RequestMethod.POST)
    public String invoiceEdit(ModelMap model,
    	@SessionAttribute Invoice viewInvoice,
    	@RequestParam(value = "status", required = false, defaultValue = "0") String status,
    	@RequestParam(value = "id", required = false, defaultValue = "0") int id) {
    	
    	viewInvoice.setStatus(status);
    	invoiceRepository.save(viewInvoice);
    	logger.info("Invoice updated");
	    
	    return "redirect:/app/invoice/view?id=" + id;
	}
    
    /* Delete invoice */
    @RequestMapping(value = "/app/invoice/delete", method = RequestMethod.GET)
    public String invoiceDelete(ModelMap model,
    	@SessionAttribute Invoice viewInvoice) {
    	
    	invoiceRepository.delete(viewInvoice);
    	logger.info("Invoide ID = " + viewInvoice.getInvoiceNumber() + " has been deleted!");
	    
    	return "redirect:/app/invoices";
	}
    

    @RequestMapping(value="/app/invoice/new", method = RequestMethod.GET)
    public String invoiceNew( ModelMap model,    	
    	@SessionAttribute User user,
    	@RequestParam(required=false) String choice) {
    	
    	// Get current user customers list
    	List<Customer> customers = customerRepository.findByUserEmail(user.getUserEmail());
        model.put("customers", customers);
     
        return "invoiceCreate";
    }
    
    /* Creating new invoice with definition */
    @RequestMapping(value="/app/invoice/new", method = RequestMethod.POST)
    public String invoiceCreate( ModelMap model,    	
    	@SessionAttribute User user,
    	@RequestParam(value = "reference") int reference, @RequestParam(value = "choice") int customerID, @RequestParam(value = "invoiceDateString") String invoiceDateString,
    	@RequestParam(value = "dueDateString") String dueDateString, @RequestParam(value = "title") String definationTitle, @RequestParam(value = "definationDateString") String definationDateString,
    	@RequestParam(value = "amount") double amount, @RequestParam(value = "price") double price, @RequestParam(value = "vat") double vat,
    	@RequestParam(value = "invoiceSum") double invoiceSum, @RequestParam(value = "status") String status) {
    	
    	String invoiceNumberString = randomString(18);
    	BigInteger invoiceNumber = new BigInteger(invoiceNumberString);
    	
    	try {
    		// Parse strings to date format
			Date invoiceDate = new SimpleDateFormat("yyyy-mm-dd").parse(invoiceDateString);
			Date dueDate = new SimpleDateFormat("yyyy-mm-dd").parse(dueDateString);
			Date definationDate = new SimpleDateFormat("yyyy-mm-dd").parse(definationDateString);
			
			// Create new invoice
			Invoice invoice = new Invoice(dueDate, invoiceDate, invoiceNumber, invoiceSum, reference, status);	
			Customer customer = customerRepository.findByCustomerID(customerID);
			invoice.setUser(user);
			invoice.setCustomerEmail(customer.getCustomerEmail());
			invoiceRepository.save(invoice);

			// Create definition for invoice
			Defination defination = new Defination(invoice, definationTitle, definationDate, amount, price, vat, invoiceSum);
			definationRepository.save(defination);

			// Invoice and definition created
			logger.info("New Invoice and Defination created with ID: " + invoice.getInvoiceID()); 
			
		} catch (ParseException e) {
			e.printStackTrace();
		}  
    	model.put("info", "Invoice created!");
        return "invoiceCreate";
    }
    
    /* For creating random invoiceNumber */
    String randomString(int len){
    	String AB = "0123456789";
    	SecureRandom rnd = new SecureRandom();
    	   StringBuilder sb = new StringBuilder(len);
    	   for(int i = 0; i < len; i++)
    	      sb.append(AB.charAt(rnd.nextInt(AB.length())));
    	   return sb.toString();
    }
    
}