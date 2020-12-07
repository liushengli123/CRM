package com.gxa.excel;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.gxa.pojo.Admin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/14
 */
public class AdminListener extends AnalysisEventListener<Admin> {

    /**
     * 日志记录器
     */
    private static final Logger LOGGER  = LoggerFactory.getLogger(AdminListener.class);

    /**
     * 每次5条
     */
    private static final int BATCH_COUNT = 5;

    List<Admin> list = new ArrayList<>();

    /**
     * 这个每一条数据解析都会来调用
     * @param admin
     * @param analysisContext
     */
    @Override
    public void invoke(Admin admin, AnalysisContext analysisContext) {
        LOGGER.info("解析到一条数据:{}", admin);
        list.add(admin);
        if (list.size() >= BATCH_COUNT) {
            System.out.println(list);
            // 存储完成清理 list
            list.clear();
        }

    }

    /**
     * 所有数据解析完会调用
     * @param analysisContext
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {
        LOGGER.info("所有数据解析完成！");
    }
}
