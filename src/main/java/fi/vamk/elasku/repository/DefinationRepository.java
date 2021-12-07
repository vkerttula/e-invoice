package fi.vamk.elasku.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import fi.vamk.elasku.model.Defination;

public interface DefinationRepository extends JpaRepository<Defination, Integer> {

}