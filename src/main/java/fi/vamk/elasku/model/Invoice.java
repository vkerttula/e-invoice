package fi.vamk.elasku.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.math.BigInteger;
import java.util.List;


/**
 * The persistent class for the invoice database table.
 * 
 */
@Entity
@NamedQuery(name="Invoice.findAll", query="SELECT i FROM Invoice i")
@Table(name = "invoice")
public class Invoice implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int invoiceID;

	@Temporal(TemporalType.DATE)
	private Date dueDate;

	@Temporal(TemporalType.DATE)
	private Date invoiceDate;

	private BigInteger invoiceNumber;

	private double invoiceSum;
	
	private String customerEmail;

	private int reference;

	private String status;

	//bi-directional many-to-one association to Defination
	@OneToMany(mappedBy="invoice", fetch=FetchType.EAGER)
	private List<Defination> definations;


	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="userEmail")
	private User user;

	public Invoice() {
	}
	
	public Invoice(Date dueDate, Date invoiceDate, BigInteger invoiceNumber, double invoiceSum, int reference, String status ) {
		this.dueDate = dueDate;
		this.invoiceDate = invoiceDate;
		this.invoiceNumber = invoiceNumber;
		this.invoiceSum = invoiceSum;
		this.reference = reference;
		this.status = status;
	}

	public int getInvoiceID() {
		return this.invoiceID;
	}

	public Date getDueDate() {
		return this.dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public Date getInvoiceDate() {
		return this.invoiceDate;
	}

	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}

	public BigInteger getInvoiceNumber() {
		return this.invoiceNumber;
	}

	public void setInvoiceNumber(BigInteger invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public double getInvoiceSum() {
		return this.invoiceSum;
	}

	public void setInvoiceSum(double invoiceSum) {
		this.invoiceSum = invoiceSum;
	}

	public int getReference() {
		return this.reference;
	}

	public void setReference(int reference) {
		this.reference = reference;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<Defination> getDefinations() {
		return this.definations;
	}

	public void setDefinations(List<Defination> definations) {
		this.definations = definations;
	}

	public Defination addDefination(Defination defination) {
		getDefinations().add(defination);
		defination.setInvoice(this);

		return defination;
	}

	public Defination removeDefination(Defination defination) {
		getDefinations().remove(defination);
		defination.setInvoice(null);

		return defination;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

}