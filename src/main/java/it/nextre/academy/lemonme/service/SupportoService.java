package it.nextre.academy.lemonme.service;

import it.nextre.academy.lemonme.dto.SupportoDto;
import it.nextre.academy.lemonme.entity.Supporto;

import java.util.List;

public interface SupportoService {

    List<Supporto> getAll();
    Supporto salva(Supporto supporto);
    Supporto salva(SupportoDto supporto);

}
