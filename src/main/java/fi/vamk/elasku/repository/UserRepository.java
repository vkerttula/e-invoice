package fi.vamk.elasku.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.vamk.elasku.model.User;

public interface UserRepository extends JpaRepository<User, String> {
	public User getById(String username);
}