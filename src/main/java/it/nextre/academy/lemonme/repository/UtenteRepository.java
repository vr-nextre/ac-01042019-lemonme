package it.nextre.academy.lemonme.repository;

import it.nextre.academy.lemonme.entity.Utente;
import org.omg.CORBA.NO_IMPLEMENT;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;

import java.util.List;


@Repository
public interface UtenteRepository extends JpaRepository<Utente, Integer> {

    Utente findByMail(String email);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.nome=:nome WHERE u.id =:idUtente")
    int updateNome(@Param("idUtente") int idUtente, @Param("nome") String nome);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.cognome =:cognome WHERE u.id=:idUtente")
    int updateCognome(@Param("idUtente") int idUtente, @Param("cognome") String cognome);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.dataDiNascita =:dataDiNascita WHERE u.id =:idUtente")
    int updateDataDiNascita(@Param("idUtente") int idUtente, @Param("dataDiNascita")Date dataDiNascita);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.sesso =:sesso WHERE u.id =:idUtente")
    int updateSesso(@Param("idUtente") int idUtente, @Param("sesso") Character sesso);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.interesse =:interesse WHERE u.id =:idUtente")
    int updateInteresse(@Param("idUtente") int idUtente, @Param("interesse") Character interesse);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.mail =:mail WHERE u.id =:idUtente")
    int updateMail(@Param("idUtente") int idUtente, @Param("mail") String mail);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.password =:password WHERE u.id =:idUtente")
    int updatePassword(@Param("idUtente") int idUtente, @Param("password") String password);

    @Transactional
    @Modifying
    @Query("UPDATE Utente u SET u.descrizione =:descrizione WHERE u.id =:idUtente")
    int updateDescrizione(@Param("idUtente") int idUtente, @Param("descrizione") String descrizione);

}//end class
