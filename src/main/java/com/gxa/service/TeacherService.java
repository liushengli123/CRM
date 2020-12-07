package com.gxa.service;

import com.gxa.pojo.DTO;
import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.TeacherParam;


public interface TeacherService {
    DTO listAll();
    DTO listTeacher(TeacherParam teacherParam);
    DTO findAll(Integer courseId);
    DTO deleteById(Integer id);
    DTO addTeacher(Teacher teacher);
    DTO delete(String[] ids);
    Teacher findById(Integer id);
    DTO edit(Teacher teacher);
}
