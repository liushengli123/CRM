package com.gxa.controller;

import com.gxa.pojo.Course;
import com.gxa.pojo.DTO;
import com.gxa.pojo.Marketplan;
import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.MarketplanParam;
import com.gxa.pojo.param.TeacherParam;
import com.gxa.service.MarketPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/market")
public class MarketPlanController {

    @Autowired
    private MarketPlanService marketPlanService;

    @GetMapping("/list/all")
    @ResponseBody
    public DTO list(){
        return marketPlanService.list();
    }

    @GetMapping("/list/data")
    @ResponseBody
    public DTO listData(MarketplanParam marketplanParam){
        return marketPlanService.listmarketplan(marketplanParam);
    }

    @RequestMapping("/list/page")
    public String listpage(){
        return "/market/market-list";
    }

    @RequestMapping("/add/page")
    public String addpage(){
        return "/market/market-add";
    }

    @PostMapping("/add")
    @ResponseBody
    public DTO add(Marketplan marketplan) throws Exception {
        return marketPlanService.add(marketplan);
    }

    @PostMapping("/delete/page")
    @ResponseBody
    public DTO deletById(@RequestParam(name = "id") Integer id){
        return marketPlanService.deleteById(id);
    }
    @PostMapping("/delete/all")
    @ResponseBody
    public DTO delete(@RequestParam(name = "ids[]") String[] ids){
        return marketPlanService.delete(ids);
    }


    @GetMapping("/edit/page/{id}")
    public String editpage(@PathVariable Integer id){
        return "market/market-edit";
    }
}
