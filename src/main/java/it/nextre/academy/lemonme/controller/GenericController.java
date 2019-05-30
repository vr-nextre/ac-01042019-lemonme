package it.nextre.academy.lemonme.controller;

import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GenericController {

    @Autowired
    Logger log;

    @GetMapping("/")
    //@GetMapping({"/","/index","/home"})
    public String getHome(){
        log.debug("path: /");
        return "index";
    }
    //esempio per redirect
    @GetMapping({"/index","/home"})
    public String redirectToHome(){
        log.debug("redirect to: /");
        return "redirect:/";
    }


    @GetMapping("/profilo")
    public String getProfilo(){
        log.debug("path: /profilo");
        return "profilo";}

    @GetMapping("/amici")
    public String getAmici(){
        log.debug("path: /amici");
        return "amici";}



    @GetMapping("/scopri")
    public String getScopri(){
        log.debug("path: /scopri");
        return "scopri";}

    @GetMapping("/registrati")
    public String getRegistrati(){
        log.debug("path: /registrati");
        return "registrati";}


    //disable error 404 if favicon isn't present
    /*
    If we don’t want any favicon for our application, we can disable it by setting
    the property spring.mvc.favicon.enabled to false. But with this when
    the browsers lookup they get a “404 Not Found” error.
    We can avoid this with a custom favicon controller, that returns an empty response:
     */
    @GetMapping("favicon.ico")
    @ResponseBody
    public void returnNoFavicon() {}

}//end class
