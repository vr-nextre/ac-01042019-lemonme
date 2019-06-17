package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.entity.Amico;
import it.nextre.academy.lemonme.repository.AmicoRepository;
import it.nextre.academy.lemonme.service.AmicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AmicoServiceImpl implements AmicoService {


    @Autowired
    private AmicoRepository amicoRepository;

    @Override
    public List<Amico> findBroById1(Integer id1) {
        return amicoRepository.findBroById1(id1);
    }

    @Override
    public List<Amico> findBroById2(Integer id2) {
        return amicoRepository.findBroById2(id2);
    }

    @Override
    public Amico chiediAmicizia(Integer id1, Integer id2) {

        Amico amico = new Amico(
                id1, id2
        );
        return amicoRepository.save(amico);
    }

    @Override
    public boolean accettaAmicizia(Integer id1, Integer id2) {

        Amico nuovo = new Amico(id1, id2);
        amicoRepository.save(nuovo);
        return true;

    }

    @Override
    public boolean rifiutaAmicizia(Integer id1, Integer id2) {

        List<Amico> amici = amicoRepository.findAll();
        Amico amicoRifiutato = null;
        System.out.println(amici.size());
        for (int i = 0; i < amici.size(); i++) {
            System.out.println("amico" + i + "id1 = " + amici.get(i).getId1());
            System.out.println("amico" + i + "id2 = " + amici.get(i).getId2());
            if (amici.get(i).getId1() == id1 && amici.get(i).getId2() == id2) {
                System.out.println("ciao");
                amicoRifiutato = amici.get(i);
                amicoRepository.delete(amici.get(i));
            }
        }

        if (amicoRifiutato != null) {
            System.out.println("Amico cancellato correttamente!");
            return true;
        }

        return false;
    }

    @Override
    public boolean cancellaAmicizia(Integer id1, Integer id2) {

        System.out.println("id1 cercato: " + id1);
        System.out.println("id2 cercato: " + id2);
        List<Amico> amici = amicoRepository.findAll();
        Amico amicoCancellato = null;
        for (int i = 0; i < amici.size(); i++) {
            System.out.println("amico" + i + "id1 = " + amici.get(i).getId1());
            System.out.println("amico" + i + "id2 = " + amici.get(i).getId2());
            if ((amici.get(i).getId1() == id1 && amici.get(i).getId2() == id2) || (amici.get(i).getId1() == id2 && amici.get(i).getId2() == id1)) {
                amicoCancellato = amici.get(i);
                amicoRepository.delete(amici.get(i));
            }
        }
        if (amicoCancellato != null) {
            System.out.println("Amico cancellato correttamente!");
            return true;
        }

        return false;

    }

    @Override
    public Amico findById1(Integer id) {
        return amicoRepository.findById1(id);
    }

    @Override
    public Amico findById2(Integer id) {
        return amicoRepository.findById2(id);
    }


} //end class
