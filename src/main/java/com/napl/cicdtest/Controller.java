package com.napl.cicdtest;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.napl.cicdtest.util.DBConstant;
import org.bson.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.*;

@org.springframework.stereotype.Controller
public class Controller {

    private final Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());
    @Autowired
    private MongoTemplate mongoTemplate;

    @RequestMapping(value = "/")
    public String hello(Model model){

        logger.info("Controller-hello");

//        model.addAttribute("name", "홍진의");
//        model.addAttribute("age", "29세");
//        model.addAttribute("name2", "홍준기");
//        model.addAttribute("age2", "30세");
        /*List<Map<String,String>> dataList = new ArrayList<>();
        MongoCollection<Document> collection = null;

        collection = mongoTemplate.getDb().getCollection(DBConstant.COLLECTION_NAME);
        FindIterable<Document> documents =  collection.find();
        MongoCursor<Document> cursor = documents.cursor();

        while (cursor.hasNext()){
            Map<String,String> map = new HashMap<>();
            Document document = cursor.next();
            String name = document.get("name").toString();
            String age = document.get("age").toString();

            map.put("name",name);
            map.put("age",age);

            dataList.add(map);
        }

        model.addAttribute("dataList",dataList);*/

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
