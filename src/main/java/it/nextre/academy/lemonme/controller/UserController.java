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
import java.io.IOException;
import java.sql.SQLDataException;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;


@Controller
public class UserController {

    @Autowired
    Logger log;

    @Autowired
    UtenteService utenteService;

    @Autowired
    private LogErrorService logErrorService;

    @Autowired
    private FileServiceImpl fileService;


    @GetMapping("/profilo")
    public String getProfilo(Model m) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());
        m.addAttribute("utente", utenteLoggato);
        /*m.addAttribute("dataParsata", ZonedDateTime
                .parse(utenteLoggato
                .getDataDiNascita()
                .toLocalDate()
                .atTime(0,0,0)
                .atZone(ZoneId.of("Europe/Rome"))
                .toString())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy")));*/
        log.debug("path: /profilo [GET]");
        return "profilo";
    }

    @GetMapping("/updateProfilo")
    public String getUpdateProfilo(Model m){
        log.debug("path: /profilo [GET]");
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Utente utenteLoggato = utenteService.findByMail(userDetails.getUsername());
        m.addAttribute("idUtente", utenteLoggato.getId());
        m.addAttribute("nome", utenteLoggato.getNome());
        m.addAttribute("cognome", utenteLoggato.getCognome());
        m.addAttribute("dataDiNascita", utenteLoggato.getDataDiNascita());
        //m.addAttribute("dataDiNascita", (new SimpleDateFormat("dd-MM-yyyy").format(utenteLoggato.getDataDiNascita())));
        m.addAttribute("sesso", utenteLoggato.getSesso());
        m.addAttribute("interesse", utenteLoggato.getInteresse());
        m.addAttribute("mail", utenteLoggato.getMail());
        m.addAttribute("password", utenteLoggato.getPassword());
        m.addAttribute("confirmPassword", utenteLoggato.getPassword());
        m.addAttribute("descrizione", utenteLoggato.getDescrizione());
        m.addAttribute("ProfiloForm", new UtenteDTO(utenteLoggato));
        return "/updateProfilo";
    }

    @ExceptionHandler(value = SQLDataException.class)
    @PutMapping("/profilo")
    public String updateUserAccount(@Valid @ModelAttribute("ProfiloForm") UtenteDTO userDto, BindingResult result) throws IOException {
        log.debug("/profilo [PUT]" + userDto.toString());
        log.debug("##### IMG: " + userDto.getImmagine().getName());
        log.debug("##### IMG: " + userDto.getImmagine().isEmpty());

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String mail = userDetails.getUsername();
        if(userDto.getPassword().isEmpty()){
            userDto.setConfirmPassword(userDto.getPassword());
            log.debug("/profilo [PUT] con password vecchia" + userDto.toString());
        }  else {
            if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
                log.error("Errore durante la registrazione: le password non coincidono");
                result.rejectValue("password", "password", "Le password non coincidono");
                LogErrorDTO logErrorDTO = new LogErrorDTO("Update profilo: Errore - le password non coincidono", 1, "password");
                logErrorService.save(logErrorDTO);
            }
        }

        if(!userDto.getImmagine().isEmpty()) {
            //Validazione estensione immagine
            if (!fileService.isValidImage(userDto.getImmagine())) {
                log.error("Errore durante l'inserimento dell'immagine");
                result.rejectValue("immagine", null, "Estensione immagine sbagliata, accettiamo solo .jpg");
                LogErrorDTO logErrorDTO = new LogErrorDTO("Update profilo: Errore durante l'inserimento dell'immagine, estensione errata", 2, "immagine");
                logErrorService.save(logErrorDTO);
            }

            //Validazione dimensione immagine
            if (!fileService.isBigger(userDto.getImmagine())) {
                log.error("Errore durante l'inserimento dell'immagine");
                result.rejectValue("immagine", null, "Dimensione immagine sbagliata");
                LogErrorDTO logErrorDTO = new LogErrorDTO("Update profilo: Errore durante l'inserimento dell'immagine, dimensione errata", 2, "immagine");
                logErrorService.save(logErrorDTO);
            }
        }

        if (result.hasErrors()) {
            log.debug(result.getAllErrors());
            return "profilo";
        }


        Utente tmp = utenteService.update(userDto, mail);

        if(!userDto.getImmagine().isEmpty()) {
            utenteService.updateImg(tmp, userDto.getImmagine());
        }

        if (tmp != null)
            log.info("Profilo aggiornato");

        return "redirect:/profilo";
    }

}//end class

