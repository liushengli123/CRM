package com.gxa.util;

import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import java.util.Set;

/**
 * @author:IT-CNLM
 * @date:Created at 2020/08/13
 */
@Component
public class MyValidator {


    private Validator validator = Validation.buildDefaultValidatorFactory().getValidator();


    /**
     * 验证的方法
     * @param o
     * @return
     */
    public void validate(Object o) throws Exception {
        Set<ConstraintViolation<Object>> errors = validator.validate(o);
        if (!errors.isEmpty()){
            // 抛出错误信息
            throw new Exception(errors.iterator().next().getMessage());
        }
    }


    /**
     * 验证的方法
     * @param o
     * @param classes : 分组的标记
     * @throws Exception
     */
    public void validate(Object o,Class<?> ... classes) throws Exception {
        Set<ConstraintViolation<Object>> errors = validator.validate(o, classes);
        if (!errors.isEmpty()){
            // 抛出错误信息
            throw new Exception(errors.iterator().next().getMessage());
        }
    }

}
