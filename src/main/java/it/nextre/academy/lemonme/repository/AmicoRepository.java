package it.nextre.academy.lemonme.repository;

import it.nextre.academy.lemonme.entity.Amico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AmicoRepository extends JpaRepository<Amico, Integer> {

   List<Amico> findBroById1(int id);
   List<Amico> findBroById2(int id);

   Amico findById1(int id);
   Amico findById2(int id);

} //end class
