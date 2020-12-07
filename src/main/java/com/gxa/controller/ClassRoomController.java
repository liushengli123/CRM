package com.gxa.controller;

import com.gxa.pojo.ClassRoom;
import com.gxa.pojo.DTO;
import com.gxa.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/class/room")
public class ClassRoomController {

    @Autowired
    private ClassRoomService classRoomService;

    @GetMapping("/list/all/data")
    @ResponseBody
    public DTO listclassroom(){
            return classRoomService.listClassRoom();
        }
}
