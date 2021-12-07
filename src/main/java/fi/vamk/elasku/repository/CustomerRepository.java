package fi.vamk.elasku.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import fi.vamk.elasku.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	public List<Customer> findByUserEmail(String username);
	public Customer findByCustomerEmail(String username);
	public Customer findByCustomerID(int customerID);
}