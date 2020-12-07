package com.gxa.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxa.mapper.TeacherMapper;
import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.CourseParam;
import com.gxa.pojo.param.TeacherParam;
import com.gxa.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public DTO listAll() {
        List<Teacher> teachers=teacherMapper.listAll();
        return new DTO("200","查询成功",teachers);
    }

    @Override
    public DTO findAll(Integer courseId) {
        List<Teacher> teacherList = teacherMapper.findAll(courseId);
        return new DTO("200","获取成功",teacherList);
    }
    @Override
    public DTO listTeacher(TeacherParam teacherParam) {
        PageHelper.startPage(teacherParam.getPage(),teacherParam.getPagesize());
        List<Teacher> listTeacher = teacherMapper.listTeacher(teacherParam);
        PageInfo pageInfo=new PageInfo(listTeacher);
        return new DTO("200","获取成功",pageInfo);
    }

    @Override
    public DTO deleteById(Integer id) {
       teacherMapper.updateById(id);
        return new DTO("200","删除成功！");
    }

    @Override
    public DTO addTeacher(Teacher teacher) {
        teacher.setCreateTime(new Timestamp(System.currentTimeMillis()));
        teacherMapper.addTeacher(teacher);
        return new DTO("200","添加成功！");
    }

    @Override
    public DTO delete(String[] ids) {
        teacherMapper.deletedByIds(ids);
        return new DTO("200","删除成功！");
    }

    @Override
    public Teacher findById(Integer id) {
        return teacherMapper.findByPK(id);
    }

    @Override
    public DTO edit(Teacher teacher) {
        teacher.setUpdateTime(new Timestamp(System.currentTimeMillis()));
        teacherMapper.update(teacher);
        return new DTO("200","修改成功");
        }
}
