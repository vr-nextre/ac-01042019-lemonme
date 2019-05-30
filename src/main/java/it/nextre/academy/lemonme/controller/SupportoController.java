package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.SupportoDto;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class SupportoController {

    @Autowired
    Logger log;


    @GetMapping("/supporto")
    public String getSupporto(){
        log.debug("path: /supporto");
        return "supporto";}

    @PostMapping("/help")
    public String doRequest(@Valid SupportoDto richiesta, BindingResult result, Model m){
        log.debug("path: /help [POST]");
        log.debug(richiesta);

        if (result.hasErrors()){
            m.addAttribute("stato",false);
            m.addAttribute("mex",result.getAllErrors());
            //todo redirect a /supporto in get con questo modello dati
            return "supporto";
        }

        //todo registrare la richiesta su db

        m.addAttribute("stato",true);
        //todo passare nel modello dati la risposta
        return "supporto";
    }

}//end class
