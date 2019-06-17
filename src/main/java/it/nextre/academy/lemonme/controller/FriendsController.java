package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.RichiestaRispostaDTO;
import it.nextre.academy.lemonme.entity.Hidden;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.service.AmicoService;
import it.nextre.academy.lemonme.service.UtenteService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.sql.SQLDataException;
import java.util.List;

@Controller
public class FriendsController {

    @Autowired
    Logger log;

    @Autowired
    UtenteService utenteService;

    @Autowired
    AmicoService amicoService;

    @GetMapping("/amici")
    public String getAmici(Model m){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());

        // Lista amici jsp
        m.addAttribute("lista_amici", utenteLoggato.getAmici());
        m.addAttribute("utente",utenteLoggato);
        log.debug("path: /amici");
        return "amici";
    }

    @ExceptionHandler(value = SQLDataException.class)
    @PostMapping("/amici")
    public String doRequest(@Valid @ModelAttribute("BottoneRimuovi") Hidden input, BindingResult result, Model m) throws DataAccessException {
        //Model - modello dati: passa i dati alla view, contiene informazioni
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());
        log.debug("path:/amici [POST]/Rimuovi");
        log.debug(input);


        if (result.hasErrors()) {
            //todo inserisci errore nel db
            return "amici";
        }

        if(amicoService.cancellaAmicizia(utenteLoggato.getId(),Integer.parseInt(input.getValue())))
            return "redirect:/amici";
        return "redirect:/index";
    }

    @ExceptionHandler(value = SQLDataException.class)
    @PostMapping("/richiesteAmicizia")
    public String doRequest2(@Valid @ModelAttribute("BottoneRichiesta") RichiestaRispostaDTO input, BindingResult result, Model m) throws DataAccessException {
        //Model - modello dati: passa i dati alla view, contiene informazioni
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());
        System.out.println("+++++++++++++++++++++++++++++++");
        System.out.println(input);
        System.out.println(input.getStato());
        System.out.println(input.getAmico());
        if( input.getStato().equals("rifiuta")) {
            log.debug("path:/richiesteAmicizia [POST]/Rifiuta");
            log.debug(input);
            if(amicoService.rifiutaAmicizia(Integer.parseInt(input.getAmico()),utenteLoggato.getId()))
                return "redirect:/richiesteAmicizia";
        }
        if (input.getStato().equals("accetta")) {
            log.debug("path:/richiesteAmicizia [POST]/Accetta");
            log.debug(input);
            if (amicoService.accettaAmicizia(utenteLoggato.getId(),Integer.parseInt(input.getAmico())))
                return "redirect:/richiesteAmicizia";
        }

        if (result.hasErrors()) {
            //todo inserisci errore nel db
            return "richiesteAmicizia";
        }

        return "redirect:/index";
    }

    @GetMapping("/richiesteAmicizia")
    public String getRichieste(Model m){
        log.debug("path: /richiesteAmicizia");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());
        m.addAttribute("utente",utenteLoggato);
        m.addAttribute("lista_amici_di", utenteLoggato.getAmiciDi());

        return "richiesteAmicizia";
    }

}//end class