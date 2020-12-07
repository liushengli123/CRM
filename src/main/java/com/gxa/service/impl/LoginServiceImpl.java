package com.gxa.service.impl;

import com.gxa.mapper.AdminMapper;
import com.gxa.pojo.Admin;
import com.gxa.pojo.DTO;
import com.gxa.service.LoginService;
import com.gxa.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@Service
public class LoginServiceImpl implements LoginService {
    /*通过注入的方式将数据库查询代理对象注入进来，将前后端进行关联*/
    @Autowired
    private AdminMapper adminMapper;
    /*实现业务逻辑，比对用户名和密码的正确性*/
    @Override
    public DTO login(Admin admin, HttpSession session) {
        Admin dbadmin=adminMapper.findByName(admin.getName());
       if(dbadmin == null){
           return new DTO("1001","用户名不存在");
       }
       if (!dbadmin.getPwd().equals(MD5Util.MD55(admin.getPwd()))){
            return new DTO("1002","密码错误");
       }
       session.setAttribute("admin",dbadmin.getName());
       dbadmin.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
       adminMapper.update(dbadmin);
        return new DTO("200","success!!!");
    }
}
