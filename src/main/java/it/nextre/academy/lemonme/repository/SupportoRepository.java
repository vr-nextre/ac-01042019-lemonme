package it.nextre.academy.lemonme.repository;

import it.nextre.academy.lemonme.entity.Supporto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SupportoRepository extends JpaRepository<Supporto, Integer> {


}//end class
