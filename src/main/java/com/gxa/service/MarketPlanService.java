package com.gxa.service;

import com.gxa.pojo.DTO;
import com.gxa.pojo.Marketplan;
import com.gxa.pojo.param.MarketplanParam;

public interface MarketPlanService {
    DTO list();
    DTO listmarketplan(MarketplanParam marketplanParam);
    DTO add(Marketplan marketplan) throws Exception;
    DTO deleteById(Integer id);
    DTO delete(String[] ids);
}
