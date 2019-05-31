package it.nextre.academy.lemonme.controller;

import it.nextre.academy.lemonme.dto.SupportoDto;
import it.nextre.academy.lemonme.service.SupportoService;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;

@Controller
public class SupportoController {

    @Autowired
    Logger log;

    @Autowired
    SupportoService supportoService;


    @GetMapping("/supporto")
    public String getSupporto(Model m){
        log.debug("path: /supporto [GET]");
        if (!m.containsAttribute("SupportoForm")) {
            log.debug("non ho trovato SupportoForm");
            m.addAttribute("SupportoForm", new SupportoDto());
        }
        return "supporto";
    }

    @PostMapping("/supporto")
    public String doRequest(@Valid @ModelAttribute("SupportoForm") SupportoDto richiesta, BindingResult result, Model m){
        log.debug("path: /supporto [POST]");
        log.debug(richiesta);
        if (result.hasErrors()){
            m.addAttribute("stato",false);
            m.addAttribute("mex",result.getAllErrors());
            return "supporto";
        }
        //todo registrare la richiesta su db
        supportoService.salva(richiesta);
        m.addAttribute("stato",true);
        return "supporto";
    }



}//end class
