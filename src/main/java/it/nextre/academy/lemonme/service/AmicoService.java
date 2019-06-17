package it.nextre.academy.lemonme.service;

import it.nextre.academy.lemonme.entity.Amico;
import java.util.List;

public interface AmicoService{

    List<Amico> findBroById1(Integer id);

    List<Amico> findBroById2(Integer id);

    Amico chiediAmicizia(Integer id1, Integer id2);

    boolean accettaAmicizia (Integer id1, Integer id2);

    boolean rifiutaAmicizia (Integer id1, Integer id2);

    boolean cancellaAmicizia (Integer id1, Integer id2);

    Amico findById1(Integer id);

    Amico findById2(Integer id);
} //end interface
