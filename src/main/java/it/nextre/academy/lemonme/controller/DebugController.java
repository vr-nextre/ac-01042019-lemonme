package it.nextre.academy.lemonme.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class DebugController {

    @GetMapping("/template")
    public String getTemplate(){
        return "template";
    }
}//end class
