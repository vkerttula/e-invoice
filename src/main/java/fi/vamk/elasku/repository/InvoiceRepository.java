package fi.vamk.elasku.repository;

import java.math.BigInteger;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import fi.vamk.elasku.model.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {
	public List<Invoice> findByUserUserEmail(String username);
	public Invoice findByInvoiceID(int invoiceID);
	public Invoice findByInvoiceNumber(BigInteger invoiceNumber);
}