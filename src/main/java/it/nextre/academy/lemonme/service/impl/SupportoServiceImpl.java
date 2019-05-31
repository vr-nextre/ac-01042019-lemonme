package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.dto.SupportoDto;
import it.nextre.academy.lemonme.entity.Supporto;
import it.nextre.academy.lemonme.repository.SupportoRepository;
import it.nextre.academy.lemonme.service.SupportoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class SupportoServiceImpl implements SupportoService {

    @Autowired
    SupportoRepository supportoRepository;

    @Override
    public List<Supporto> getAll() {
        return supportoRepository.findAll();
    }

    @Override
    public Supporto salva(Supporto supporto) {
        if (supporto.getEmail() != null && supporto.getMessaggio() !=null){
            return supportoRepository.save(supporto);
        }
        return null;
    }
    @Override
    public Supporto salva(SupportoDto supporto) {
        Supporto sup = new Supporto(
                supporto.getNome(),
                supporto.getEmail(),
                supporto.getOggetto(),
                supporto.getMessaggio()
        );
        return salva(sup);
    }


}//end class
