package it.nextre.academy.lemonme.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GenericController {

    @GetMapping("/")
    //@GetMapping({"/","/index","/home"})
    public String getHome(){
        return "index.html";
    }

    //esempio per redirect
    @GetMapping({"/index","/home"})
    public String redirectToHome(){
        return "redirect:/";
    }

}//end class
