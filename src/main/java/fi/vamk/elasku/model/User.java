package fi.vamk.elasku.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
@Table(name = "user")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String userEmail;

	private String address;

	private String bankAccountNumber;

	private String businessID;

	private String city;

	private String password;

	private int postalCode;

	private String rolename;

	@Temporal(TemporalType.DATE)
	private Date subscription;
	
	private String userName;

	//bi-directional many-to-one association to Invoice
	@OneToMany(mappedBy="user")
	private List<Invoice> invoices;

	public User() {
	}
	
	public User(String username, String name, String password) {
		this.userEmail = username;
		this.password = password;
		this.userName = name;
		this.address = "Default";
		this.bankAccountNumber = "Default";
		this.businessID = "Default";
		this.city = "Default";
		this.postalCode = 00000;
		this.rolename = "ROLE_USER";
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBankAccountNumber() {
		return this.bankAccountNumber;
	}

	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
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

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(int postalCode) {
		this.postalCode = postalCode;
	}

	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Date getSubscription() {
		return this.subscription;
	}

	public void setSubscription(Date subscription) {
		this.subscription = subscription;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Invoice> getInvoices() {
		return this.invoices;
	}

	public void setInvoices(List<Invoice> invoices) {
		this.invoices = invoices;
	}

	public Invoice addInvoice(Invoice invoice) {
		getInvoices().add(invoice);
		invoice.setUser(this);

		return invoice;
	}

	public Invoice removeInvoice(Invoice invoice) {
		getInvoices().remove(invoice);
		invoice.setUser(null);

		return invoice;
	}
	


}