package it.nextre.academy.lemonme.service.impl;

import it.nextre.academy.lemonme.dto.UtenteDTO;
import it.nextre.academy.lemonme.entity.Role;
import it.nextre.academy.lemonme.entity.Utente;
import it.nextre.academy.lemonme.repository.UtenteRepository;
import it.nextre.academy.lemonme.service.UtenteService;
import org.apache.logging.log4j.Logger;
import org.apache.tomcat.jni.PasswordCallback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service //SOLO SULL'IMPLEMENTAZIONE
public class UtenteServiceImpl implements UtenteService, UserDetailsService {

    @Autowired
    private UtenteRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    FileServiceImpl fsimpl;

    @Autowired
    private Logger log;

    public Utente findByMail(String email) {
        return userRepository.findByMail(email);
    }



    public Utente save(UtenteDTO utente) {
        log.debug("UtenteServiceImpl.save");
        log.debug("Utente Service Impl UTENTE DTO: " + utente.toString());
        Utente user = new Utente(
                utente.getNome(),
                utente.getCognome(),
                utente.getDataDiNascita(),
                utente.getSesso(),
                utente.getInteresse(),
                utente.getMail(),
                utente.getDescrizione(),
                utente.getAmici(),
                utente.getAmiciDi()
        );
        log.debug("UTENTE: " + user.toString());
        user.setRoles(Arrays.asList(new Role("ROLE_USER")));
        user.setPassword(passwordEncoder.encode(utente.getPassword()));
        log.debug("PWD SAVE:" + user.getPassword());
        return userRepository.save(user);
    }

    @Override
    public Utente saveImg(Utente user, MultipartFile mfile) throws IOException {
            log.debug("Immagine valida");
            Path toSave = Paths.get(".", "src", "main", "webapp", "WEB-INF", "static", "profileImage",""+user.getId());
            if (!toSave.toFile().exists()) {
                if (!toSave.toFile().mkdirs()) {
                    log.debug("errore creazione cartella utente");
                }
                if (!mfile.isEmpty()) {
                    BufferedImage src = ImageIO.read(new ByteArrayInputStream(mfile.getBytes()));
                    File destination = new File(toSave+"\\imgprofile.jpg");
                    ImageIO.write(src, "jpg", destination);
                }
            } else {
                log.debug("IMMAGINE " + mfile.getOriginalFilename() + " NON VALIDA");
            }

            return user;
    }

    @Override
    public List<Utente> findAll() {
        return userRepository.findAll();
    }


    @Override
    public Utente updateImg(Utente utente, MultipartFile multipartFile) throws IOException {
        log.debug("Immagine valida UPDATE");
        Path toSave = Paths.get(".", "src", "main", "webapp", "WEB-INF", "static", "profileImage",""+utente.getId());
        BufferedImage src = ImageIO.read(new ByteArrayInputStream(multipartFile.getBytes()));
        File oldImg = new File(toSave+"\\imgprofile.jpg");
        oldImg.delete();
        File destination = new File(toSave+"\\imgprofile.jpg");
        ImageIO.write(src, "jpg", destination);
        return utente;
    }

    public Utente createAdmin(){
        Utente user = new Utente();
        user.setNome("Riccardo");
        user.setCognome("Bottini");
        user.setMail("admin@nextre.it");
        user.setSesso('M');
        user.setDataDiNascita(java.sql.Date.valueOf("1995-07-17"));
        user.setPassword(passwordEncoder.encode("admin"));
        user.setRoles(Arrays.asList(new Role("ROLE_ADMIN")));
        return userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Utente user = userRepository.findByMail(email);
        if (user == null) {
            throw new UsernameNotFoundException("Mail o password non valida.");
        }
        return new org.springframework.security.core.userdetails.User(user.getMail(),
                user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream()
                .map(role -> new SimpleGrantedAuthority(role.getName()))
                .collect(Collectors.toList());
    }

    @Override
    public Utente update(UtenteDTO utenteDTO, String mail){

        Integer idUtente = userRepository.findByMail(mail).getId();
        userRepository.updateNome(idUtente, utenteDTO.getNome());
        userRepository.updateCognome(idUtente, utenteDTO.getCognome());
        userRepository.updateDataDiNascita(idUtente, utenteDTO.getDataDiNascita());
        userRepository.updateMail(idUtente, utenteDTO.getMail());
        userRepository.updateDescrizione(idUtente, utenteDTO.getDescrizione());
        userRepository.updateInteresse(idUtente, utenteDTO.getInteresse());
        userRepository.updateSesso(idUtente, utenteDTO.getSesso());
        if(!utenteDTO.getPassword().isEmpty() && !utenteDTO.getConfirmPassword().isEmpty()) {
            userRepository.updatePassword(idUtente, passwordEncoder.encode(utenteDTO.getPassword()));
        } else {
            userRepository.updatePassword(idUtente, userRepository.findByMail(mail).getPassword());
            System.out.println("Password: " + userRepository.findByMail(mail).getPassword());
        }

        return userRepository.findByMail(utenteDTO.getMail());
    }
}//end class
