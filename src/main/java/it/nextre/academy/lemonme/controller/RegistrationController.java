package it.nextre.academy.lemonme.controller;


import it.nextre.academy.lemonme.dto.LogErrorDTO;
import it.nextre.academy.lemonme.dto.UtenteDTO;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.service.LogErrorService;
import it.nextre.academy.lemonme.service.UtenteService;
import it.nextre.academy.lemonme.service.impl.FileServiceImpl;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.io.*;
import java.sql.SQLDataException;


@Controller
@RequestMapping("/registrati")
public class RegistrationController {

    @Autowired
    UtenteService userService;

    @Autowired
    Logger log;

    @Autowired
    private LogErrorService logErrorService;
    @Autowired
    private FileServiceImpl fileService;

    @ModelAttribute("RegistrazioneForm")
    public UtenteDTO userRegistrationDto() {
        return new UtenteDTO();
    }

    @GetMapping
    public String showRegistrationForm(Model model) {
        model.addAttribute("RegistrazioneForm", new UtenteDTO());
        return "registrati";
    }

    @ExceptionHandler(value = SQLDataException.class)
    @PostMapping
    public String registerUserAccount(@Valid @ModelAttribute("RegistrazioneForm") UtenteDTO userDto, BindingResult result) throws IOException {
        log.debug("/registrati [POST]" + userDto.toString());
        if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
            log.error("Errore durante la registrazione: le password non coincidono");
            result.rejectValue("password", "password", "Le password non coincidono");
            LogErrorDTO logErrorDTO = new LogErrorDTO("Errore durante la registrazione: le password non coincidono", 1, "password");
            logErrorService.save(logErrorDTO);
        }

        Utente existing = userService.findByMail(userDto.getMail());
        if (existing != null) {
            log.error("Errore durante la registrazione: mail già presente");
            result.rejectValue("mail", null, "Questo indirizzo mail è già presente nel sistema");
            LogErrorDTO logErrorDTO = new LogErrorDTO("Errore durante la registrazione: mail già presente", 1, "mail");
            logErrorService.save(logErrorDTO);
        }

        //Esistenza immmagine
        if (fileService.isEmpty(userDto.getImmagine())) {
            log.error("Nessuna immagine inserita");
            result.rejectValue("immagine", null, "Inserire un'immagine del profilo");
            LogErrorDTO logErrorDTO = new LogErrorDTO("Errore durante la registrazione: Nessuna immagine inserita", 1, "immagine");
            logErrorService.save(logErrorDTO);
        } else {

            //Validazione estensione immagine
            if (!fileService.isValidImage(userDto.getImmagine())) {
                log.error("Errore durante l'inserimento dell'immagine");
                result.rejectValue("immagine", null, "Estensione immagine sbagliata, accettiamo solo .jpg");
                LogErrorDTO logErrorDTO = new LogErrorDTO("Errore durante l'inserimento dell'immagine, estensione errata", 2, "immagine");
                logErrorService.save(logErrorDTO);
            }

            //Validazione dimensione immagine
            if (!fileService.isBigger(userDto.getImmagine())) {
                log.error("Errore durante l'inserimento dell'immagine");
                result.rejectValue("immagine", null, "Dimensione immagine sbagliata");
                LogErrorDTO logErrorDTO = new LogErrorDTO("Errore durante l'inserimento dell'immagine, dimensione errata", 2, "immagine");
                logErrorService.save(logErrorDTO);
            }
        }

        if (result.hasErrors()) {
            log.debug(result.getAllErrors());
            return "registrati";
        }

        Utente tmp = userService.save(userDto);
        userService.saveImg(tmp, userDto.getImmagine());

        if (tmp != null)
            log.info("Utente registrato correttamente");

        return "redirect:/";
    }

}//end class