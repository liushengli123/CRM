package com.gxa.exception;

import com.gxa.pojo.DTO;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class SystemExceptionHandler {

        @ExceptionHandler(Exception.class)
        public DTO myExceptionHandler(Exception e){
            return new DTO("5001",e.getMessage());
        }
}
