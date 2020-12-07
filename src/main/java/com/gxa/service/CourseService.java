package com.gxa.service;

import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.param.CourseParam;

public interface CourseService {
    DTO listCourse();
    DTO listCourse(CourseParam courseParam);
    DTO addCourse(Course course);
    DTO delete(String[] ids);
    Course findById(Integer id);
    DTO edit(Course course);
    DTO deleteById(Integer id);
}
