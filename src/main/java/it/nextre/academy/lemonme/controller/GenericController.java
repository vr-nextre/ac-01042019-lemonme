package it.nextre.academy.lemonme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GenericController {
    @GetMapping("/")
    //@GetMapping({"/","/index","/home"})
    public String getHome(){
        return "index";
    }
    //esempio per redirect
    @GetMapping({"/index","/home"})
    public String redirectToHome(){
        return "redirect:/";
    }


    @GetMapping("/profilo")
    public String getProfilo(){ return "profilo";}

    @GetMapping("/amici")
    public String getAmici(){ return "amici";}

    @GetMapping("/supporto")
    public String getSupporto(){ return "supporto";}

    @GetMapping("/scopri")
    public String getScopri(){ return "scopri";}

    @GetMapping("/registrati")
    public String getRegistrati(){ return "registrati";}


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
