package com.gxa.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxa.mapper.CourseMapper;
import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.param.CourseParam;
import com.gxa.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseMapper courseMapper;
    @Override
    public DTO listCourse() {
//        PageHelper.startPage(1,3);
        List<Course> listcourse = courseMapper.findAll2();
        return new DTO("200","获取成功",listcourse);
    }

    @Override
    public DTO listCourse(CourseParam courseParam) {
        PageHelper.startPage(courseParam.getPage(),courseParam.getPagesize());
        List<Course> listcourse = courseMapper.findAll(courseParam);
        PageInfo pageInfo=new PageInfo(listcourse);
        return new DTO("200","获取成功",pageInfo);
    }

    @Override
    public DTO addCourse(Course course) {
        Course dbcourse=courseMapper.findByName(course.getCourseName());
        if (dbcourse!=null){
            return new DTO("1004","课程已存在！");
        }
        course.setCreateTime(new Timestamp(System.currentTimeMillis()));
        courseMapper.save(course);
        return new DTO("200","添加成功！");
    }

    @Override
    public DTO delete(String[] ids) {
        courseMapper.deletedByIds(ids);
        return new DTO("200","删除成功！");
    }

    @Override
    public Course findById(Integer id) {
        Course dbcourse = courseMapper.findByPK(id);
        return dbcourse;
    }

    @Override
    public DTO edit(Course course) {
        course.setUpdateTime(new Timestamp(System.currentTimeMillis()));
      //  System.out.println(course);
        courseMapper.update(course);
        return new DTO("200","修改成功！");
    }

    @Override
    public DTO deleteById(Integer id) {
        courseMapper.updateById(id);
        return new DTO("200","删除成功！");
    }

}
