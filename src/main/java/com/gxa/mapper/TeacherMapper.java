package com.gxa.mapper;

import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.TeacherParam;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.ss.formula.functions.T;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;

public interface TeacherMapper {
    List<Teacher> listAll();
    List<Teacher> listTeacher(@Param("teacherParam") TeacherParam teacherParam);
    Teacher findByPK(@Param("id") Integer id);
    List<Teacher> findAll(@Param("courseId") Integer courseId);
    void updateTeacherStatus(@Param("status") Integer status,
                             @Param("teacherId") Integer teacherId);
    void updateById(@Param("id") Integer id);

    void addTeacher(@Param("teacher") Teacher teacher);

    void deletedByIds(@Param("ids") String[] ids);

    void update(@Param("teacher") Teacher teacher);
}
