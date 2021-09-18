package com.napl.cicdtest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping(value = "/")
    public String hello(Model model){
        System.out.println("RUN!");
        model.addAttribute("name", "홍진의");
        model.addAttribute("age", "29세");

        return "index";
    }
}
