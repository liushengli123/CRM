package com.gxa.controller;

import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.param.CourseParam;
import com.gxa.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("course")
public class CourseController {

        @Autowired
        private CourseService courseService;

        @GetMapping("/list")
        public String listpage(){
            return "course/course-list";
        }

        @GetMapping("/list/data")
        @ResponseBody
        public DTO listData(CourseParam courseParam){
            return courseService.listCourse(courseParam);
        }

        @GetMapping("/list/all/data")
        @ResponseBody
        public  DTO listDate(){
                return  courseService.listCourse();
        }

        @GetMapping("/add/page")
        public String addPage(){
                return "course/course-add";
        }

        @PostMapping("/add")
        @ResponseBody
        public DTO add(Course course){
                return courseService.addCourse(course);
        }

        @PostMapping("/delete")
        @ResponseBody
        public DTO delete(@RequestParam(name = "ids[]") String[] ids){
                return courseService.delete(ids);
        }

        @GetMapping("/edit/page/{id}")
        public String editpage(@PathVariable Integer id, Model model){
                Course dbcourse=courseService.findById(id);
                model.addAttribute("course",dbcourse);
                return "course/course-edit";
        }

        @PostMapping("/edit")
        @ResponseBody
        public DTO edit(Course course){
                return courseService.edit(course);
        }


        @PostMapping("/delete/page")
        @ResponseBody
        public DTO deletById(@RequestParam(name = "id") Integer id){
                return courseService.deleteById(id);
        }
}
