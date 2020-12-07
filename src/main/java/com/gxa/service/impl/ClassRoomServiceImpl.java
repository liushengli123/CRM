package com.gxa.service.impl;

import com.gxa.mapper.ClassRoomMapper;
import com.gxa.pojo.ClassRoom;
import com.gxa.pojo.DTO;
import com.gxa.service.ClassRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassRoomServiceImpl implements ClassRoomService {

    @Autowired
    private ClassRoomMapper classRoomMapper;

    @Override
    public DTO listClassRoom() {
        List<ClassRoom> classRooms = classRoomMapper.findAll();
        return new DTO("200","查询成功",classRooms);
    }
}
