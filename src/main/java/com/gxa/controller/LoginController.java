package com.gxa.controller;

import com.gxa.pojo.Admin;
import com.gxa.pojo.DTO;
import com.gxa.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;

    @GetMapping("login")
    public String loginPage(){
        return "login";
    }

    @PostMapping("login")
    @ResponseBody
    public DTO login(Admin admin, HttpSession session){
        return loginService.login(admin,session);
    }

    @GetMapping("loginout")
    @ResponseBody
    public DTO loginout(HttpSession session){
        session.removeAttribute("admin");
        return new DTO("200","退出成功！！");
    }
}
