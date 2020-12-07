package com.gxa.mapper;

import com.gxa.pojo.Admin;
import com.gxa.pojo.DTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/12
 */
public interface AdminMapper {

    /**
     * 查询所有
     * @return
     */
    List<Admin> findAll();

    /*通过name查询*/
    Admin findByName(@Param("name") String name);

    /*修改会员信息*/
    void update(@Param("admin") Admin admin);
}
