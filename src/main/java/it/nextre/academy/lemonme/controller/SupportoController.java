package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.SupportoDTO;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.service.SupportoService;
import it.nextre.academy.lemonme.service.UtenteService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class SupportoController {

    @Autowired
    Logger log;

    @Autowired
    SupportoService supportoService;

    @Autowired
    UtenteService utenteService;


    @GetMapping("/supporto")
    public String getSupporto(Model m) {
        log.debug("path:/supporto");
        if(!m.containsAttribute("SupportoForm")){
            m.addAttribute("SupportoForm", new SupportoDTO());
        }

        return "supporto";
    }

    @PostMapping("/supporto")
    public String doRequest(@Valid @ModelAttribute("SupportoForm") SupportoDTO richiesta, BindingResult result, Model m) throws DataAccessException {
        //Model - modello dati: passa i dati alla view, contiene informazioni
        log.debug("path:/supporto [POST]");
        log.debug(richiesta);

        if (result.hasErrors()) {
            m.addAttribute("stato", false);
            m.addAttribute("mex", result.getAllErrors());
            return "supporto";
        }
        supportoService.salva(richiesta);
        m.addAttribute("stato", true);
        return "supporto";
    }

}//end class
