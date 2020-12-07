package com.gxa.mapper;

import com.gxa.pojo.ClassRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassRoomMapper {
    ClassRoom findByPK(@Param("id") Integer id);
    List<ClassRoom> findAll();
    void updateClassRoomStatus(@Param("status") Integer status,@Param
            ("classRoomId") Integer
                               classRoomId);
}
