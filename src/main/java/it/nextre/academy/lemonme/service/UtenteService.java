package it.nextre.academy.lemonme.service;

import it.nextre.academy.lemonme.dto.UtenteDTO;
import it.nextre.academy.lemonme.entity.Utente;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

public interface UtenteService extends UserDetailsService {

    Utente findByMail(String email);
    Utente createAdmin();
    Utente save(UtenteDTO registration);
    Utente saveImg(Utente utente,MultipartFile mfile) throws IOException;
    Utente update(UtenteDTO utenteDTO, String mail);
    Utente updateImg(Utente utente, MultipartFile multipartFile) throws IOException;
    //void saveImg(Utente utente,MultipartFile mfile) throws IOException;
    List<Utente> findAll();

}//end class
