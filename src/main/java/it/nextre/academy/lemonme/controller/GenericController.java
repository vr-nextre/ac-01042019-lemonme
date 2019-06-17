package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.service.UtenteService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GenericController {

    @Autowired
    Logger log;

    @Autowired
    UtenteService utenteService;

    @GetMapping("/")
    //@GetMapping({"/","/home","/index"})
    public String getHome(Model m) {
        log.debug("path:/");
        return "index";
    }

    @GetMapping("/login")
    public String getLogin(Model model){
        log.debug("A DEBUG Message");

        return "redirect:/";
    }


    @GetMapping("/logout")
    public String getLogout(){
        log.debug("path:/logout");

        return "login";
    }


    @GetMapping({"/home","/index"})
    public String redirectToHome(){
        log.debug("redirect to /");

        return "redirect:/";
    }
}//end class
