package com.gxa.service;

import com.gxa.pojo.Admin;
import com.gxa.pojo.DTO;

import javax.servlet.http.HttpSession;

public interface LoginService {
    DTO login(Admin admin, HttpSession session);
}
