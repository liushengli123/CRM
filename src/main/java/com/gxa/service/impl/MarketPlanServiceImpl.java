package com.gxa.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gxa.mapper.ClassRoomMapper;
import com.gxa.mapper.MarketPlanMapper;
import com.gxa.mapper.TeacherMapper;
import com.gxa.pojo.DTO;
import com.gxa.pojo.Marketplan;
import com.gxa.pojo.Teacher;
import com.gxa.pojo.param.MarketplanParam;
import com.gxa.pojo.param.TeacherParam;
import com.gxa.service.MarketPlanService;
import com.gxa.util.MyValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Service
@Transactional(rollbackFor = Throwable.class)
public class MarketPlanServiceImpl implements MarketPlanService {

    @Autowired
    private MyValidator myValidator;
    @Autowired
    private MarketPlanMapper marketPlanMapper;
    @Autowired
    private TeacherMapper teacherMapper;
    @Autowired
    private ClassRoomMapper classRoomMapper;

    @Override
    public DTO list() {
        List<Marketplan> mapperAll = marketPlanMapper.findAll();
        return new DTO("200","查询成功",mapperAll);
    }

    @Override
    public DTO listmarketplan(MarketplanParam marketplanParam) {
        PageHelper.startPage(marketplanParam.getPage(),marketplanParam.getPagesize());
        List<Marketplan> listmarketplan = marketPlanMapper.listmarketplan(marketplanParam);
        PageInfo pageInfo=new PageInfo(listmarketplan);
        return new DTO("200","获取成功",pageInfo);
    }
    @Override
    public DTO add(Marketplan marketplan) throws Exception {
        marketplan.setCreateTime(new Timestamp(System.currentTimeMillis()));
        myValidator.validate(marketplan);
        teacherMapper.updateTeacherStatus(2,marketplan.getTeacherId());
        classRoomMapper.updateClassRoomStatus(3,marketplan.getClassRoomId());
        marketPlanMapper.addMarket(marketplan);
        return new DTO("200","添加成功");
    }

    @Override
    public DTO deleteById(Integer id) {
        marketPlanMapper.updateById(id);
        return new DTO("200","删除成功！");
    }

    @Override
    public DTO delete(String[] ids) {
       marketPlanMapper.deletedByIds(ids);
        return new DTO("200","删除成功！");
    }
}
