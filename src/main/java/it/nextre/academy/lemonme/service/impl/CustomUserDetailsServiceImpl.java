package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.config.CustomUserDetails;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.repository.UtenteRepository;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class CustomUserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    Logger log;

    @Autowired
    UtenteRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.debug("Calling loadUserByUsername method with username: " + username);

        Utente tmp = userRepository.findByMail(username);
        System.out.println("####"+tmp);
        System.out.println("####"+new CustomUserDetails(tmp));

        return new CustomUserDetails(tmp);
    }
}//end class