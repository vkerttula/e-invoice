package fi.vamk.elasku.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the defination database table.
 * 
 */
@Entity
@NamedQuery(name="Defination.findAll", query="SELECT d FROM Defination d")
@Table(name = "defination")
public class Defination implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int definationID;

	private double amount;

	@Temporal(TemporalType.DATE)
	private Date definationDate;

	private double definationSum;

	private double price;

	private String title;

	private double vat;

	//bi-directional many-to-one association to Invoice
	@ManyToOne
	@JoinColumn(name="invoiceID")
	private Invoice invoice;

	public Defination() {
	}
	
	public Defination(Invoice invoice, String title, Date definationDate, double amount, double price, double vat, double definationSum) {
		this.invoice = invoice;
		this.title = title;
		this.definationDate = definationDate;
		this.amount = amount;
		this.price = price;
		this.vat = vat;
		this.definationSum = definationSum;
	}

	public int getDefinationID() {
		return this.definationID;
	}

	public void setDefinationID(int definationID) {
		this.definationID = definationID;
	}

	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getDefinationDate() {
		return this.definationDate;
	}

	public void setDefinationDate(Date definationDate) {
		this.definationDate = definationDate;
	}

	public double getDefinationSum() {
		return this.definationSum;
	}

	public void setDefinationSum(double definationSum) {
		this.definationSum = definationSum;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getVat() {
		return this.vat;
	}

	public void setVat(double vat) {
		this.vat = vat;
	}

	public Invoice getInvoice() {
		return this.invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}

}