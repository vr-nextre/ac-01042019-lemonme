package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.AmicoDTO;
import it.nextre.academy.lemonme.entity.Amico;
import it.nextre.academy.lemonme.entity.Hidden;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.service.AmicoService;
import it.nextre.academy.lemonme.service.DBErrorService;
import it.nextre.academy.lemonme.service.UtenteService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.List;


@Controller
public class ScopriController {

    @Autowired
    Logger log;

    @Autowired
    UtenteService utenteService;

    @Autowired
    AmicoService amicoService;

    @Autowired
    DBErrorService dbErrorService;

    @GetMapping("/scopri")
    public String getScopri(Model m) {
        log.debug("path: /scopri");
        if (!m.containsAttribute("ScopriForm")) {
            m.addAttribute("ScopriForm", new AmicoDTO());
        }
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());

        //Tutti gli utenti presenti nel db
        // m.addAttribute("utenti", utenteService.findAll());
        //Tutte le richieste di amicizia inviate da utente loggato
        // m.addAttribute("amico", amicoService.findBroById1(utenteLoggato.getId()));
        List<Utente> user = utenteService.findAll();
        List<Utente> tmp = utenteService.findAll();
        List<Amico> bro = amicoService.findBroById1(utenteLoggato.getId());
        int k = user.size();
        if(!bro.isEmpty() && !user.isEmpty()) {
            for (Amico a : bro) {
                for (int i = 0; i < k; i++) {
                    if(a.getId2() == user.get(i).getId())
                   tmp.remove(user.get(i));
         }
            }
            m.addAttribute("amico",tmp);
        } else {
            if(!user.isEmpty())
            m.addAttribute("amico",user);
        }


        return "scopri";
    }



    @PostMapping("/scopri")
    public String doRequest(@Valid @ModelAttribute("ScopriForm") AmicoDTO richiesta, Hidden input, BindingResult result, Model m) throws DataAccessException {
        //Model - modello dati: passa i dati alla view, contiene informazioni
        log.debug("path:/scopri [POST]");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());

        if (result.hasErrors()) {
            m.addAttribute("mex", result.getAllErrors());
            return "scopri";
        }

        /*
        log.debug("-------Utente loggato------------");
        log.debug(utenteLoggato.getId());
        log.debug("-------Hidden value-----------");
        log.debug(input);*/
        amicoService.chiediAmicizia(utenteLoggato.getId(), Integer.parseInt(input.getValue()));

        return "redirect:/scopri";
    }

}//end class