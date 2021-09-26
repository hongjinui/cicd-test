package com.napl.cicdtest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;

@org.springframework.stereotype.Controller
public class Controller {

    @RequestMapping(value = "/")
    public String hello(Model model){
        System.out.println("RUN!");
        model.addAttribute("name", "홍진의");
        model.addAttribute("age", "29세");
        model.addAttribute("name2", "홍준기");
        model.addAttribute("age2", "30세");

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String time = simpleDateFormat.format(date);

        model.addAttribute("time",time);

        try{
            InetAddress ip = InetAddress.getLocalHost(); // => 컴퓨터명/IP 출력
            String hostAddress = ip.getHostAddress(); // => IP 출력
            String hostName = ip.getCanonicalHostName();

            model.addAttribute("hostAddress",hostAddress);
            model.addAttribute("hostName",hostName);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }

        return "index";
    }
}
