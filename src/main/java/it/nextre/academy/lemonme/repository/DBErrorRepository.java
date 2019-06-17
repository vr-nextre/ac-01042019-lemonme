package it.nextre.academy.lemonme.repository;

import it.nextre.academy.lemonme.entity.DBError;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DBErrorRepository extends JpaRepository<DBError, Integer> {
}//end class
