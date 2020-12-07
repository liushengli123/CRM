package com.gxa.controller;

import com.gxa.pojo.Admin;
import com.sun.javafx.sg.prism.NGShape;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;


/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/12
 */
@Controller
public class IndexController {

    @GetMapping("welcome")
    public String welcome(){
        return "welcome";
    }

    @GetMapping("index")
    public String index(){
        return "index";
    }
}
