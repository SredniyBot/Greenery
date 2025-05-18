package ru.greenery.greenery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping
    public String getMain(){
        return "index";
    }

    @GetMapping("/index")
    public String getSubMain(){
        return "redirect:/";
    }



}
