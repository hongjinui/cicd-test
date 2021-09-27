package com.napl.cicdtest;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {

    private final Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

    @RequestMapping(value = "/")
    public String hello(Model model){

        logger.info("Controller-hello");

        // model.addAttribute("name", "aaa");
        // model.addAttribute("age", "29세");
        // model.addAttribute("name2", "bbb");
        // model.addAttribute("age2", "30세");
        // model.addAttribute("name3", "ccc");
        // model.addAttribute("age3", "99세");
        
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
