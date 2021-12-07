package fi.vamk.elasku.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the customer database table.
 * 
 */
@Entity
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
@Table(name = "customer")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	private String customerEmail;
	
	private String userEmail;

	private String address;

	private String businessID;

	private String city;

	@Id
	private int customerID;

	private String customerName;

	private int postalCode;

	public Customer() {
	}
	
	public Customer(String customerEmail, String address, String businessID, String city, String customerName, int postalCode) {
		this.customerEmail = customerEmail;
		this.userEmail = "";
		this.address = address;
		this.businessID = businessID;
		this.city =city;
		this.customerName = customerName;
		this.postalCode = postalCode;
	}

	public String getCustomerEmail() {
		return this.customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinessID() {
		return this.businessID;
	}

	public void setBusinessID(String businessID) {
		this.businessID = businessID;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getCustomerID() {
		return this.customerID;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public int getPostalCode() {
		return this.postalCode;
	}
	
	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}

}