package cn.lxsir.uniapp.handler;


import cn.lxsir.uniapp.exception.BaseException;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLException;

/**
 * 全局异常处理器，处理项目中抛出的业务异常
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 捕获业务异常
     * @param ex
     * @return
     */
    @ExceptionHandler
    public R exceptionHandler(BaseException ex){
        log.info("异常信息：{}", ex.getMessage());
        return R.failed(ex.getMessage());
    }


    @ExceptionHandler
    public R exceptionHandler(SQLException ex){
        log.info("数据库异常：{}", ex.getMessage());
        return R.failed("数据库异常:" + ex.getMessage());
    }



}
