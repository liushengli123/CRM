package com.gxa.mapper;

import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.param.CourseParam;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface CourseMapper {
    /**
     * @return
     */
    List<Course> findAll2();

    List<Course> findAll(@Param("courseParam") CourseParam courseParam);

    Course findByName(String courseName);

    void save(@Param("course") Course course);

    void deletedByIds(@Param("ids") String[] ids);

    Course findByPK(@Param("id") Integer id);

    void update(@Param("course") Course course);

    void updateById(@Param("id") Integer id);

}
