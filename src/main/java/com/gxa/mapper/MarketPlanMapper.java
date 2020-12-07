package com.gxa.mapper;

import com.gxa.pojo.Marketplan;
import com.gxa.pojo.param.MarketplanParam;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MarketPlanMapper {
    List<Marketplan> findAll();
    List<Marketplan> listmarketplan(@Param("marketplanParam") MarketplanParam marketplanParam);
    void addMarket(@Param("marketplan") Marketplan marketplan);
    void updateById(@Param("id") Integer id);
    void deletedByIds(@Param("ids") String[] ids);
}
