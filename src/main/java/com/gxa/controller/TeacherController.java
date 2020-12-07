package com.gxa.controller;

import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.Marketplan;
import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.CourseParam;
import com.gxa.pojo.param.TeacherParam;
import com.gxa.service.CourseService;
import com.gxa.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.jws.soap.SOAPBinding;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private CourseService courseService;

    @GetMapping("/list/course/{courseId}")
    @ResponseBody
    public DTO list(@PathVariable Integer courseId){
        return teacherService.findAll(courseId);
    }
    @GetMapping("/list/all")
    public String list(){
        return "teacher/teacher-list";
    }

    @GetMapping("/list/data")
    @ResponseBody
    public DTO listData(TeacherParam teacherParam){
        return teacherService.listTeacher(teacherParam);
    }
    @GetMapping("/list/all/data")
    @ResponseBody
    public DTO listData(){
        return teacherService.listAll();
    }

    @PostMapping("/delete/page")
    @ResponseBody
    public DTO deletById(@RequestParam(name = "id") Integer id){
        return teacherService.deleteById(id);
    }

    @RequestMapping("/add/page")
    public String addpage(){
        return "/teacher/teacher-add";
    }

    @PostMapping("/add")
    @ResponseBody
    public DTO add(Teacher teacher){
        return teacherService.addTeacher(teacher) ;
    }

    @PostMapping("/delete")
    @ResponseBody
    public DTO delete(@RequestParam(name = "ids[]") String[] ids){
        return teacherService.delete(ids);
    }

    @GetMapping("/edit/page/{id}")
    public String editpage(@PathVariable Integer id, Model model){
        Teacher dbteacher=teacherService.findById(id);
        Course course = courseService.findById(dbteacher.getCourseId());
        String[] genders=new String[]{"女","男"};
        int index=dbteacher.getTeacherGender().intValue();
        model.addAttribute("gender",genders[index]);
        model.addAttribute("courseName",course.getCourseName());
        model.addAttribute("teacher",dbteacher);
        return "teacher/teacher-edit";
    }
    @PostMapping("/edit")
    @ResponseBody
    public DTO edit(Teacher teacher){
        return teacherService.edit(teacher);
    }
}
