package cn.lxsir.uniapp.interceptor;

import cn.lxsir.uniapp.utils.BaseContext;
import cn.lxsir.uniapp.utils.JwtUtils;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.api.R;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截器Interceptor：在controller之前将请求拦截
 */
@Slf4j
@Component
public class LoginCheckInterceptor implements HandlerInterceptor {

    @Override//目标资源方法执行前执行，返回true：放行，返回false：不放行
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //1.获取请求头中的令牌（token）
        String jwt = request.getHeader("token");
        //2.判断token是否为空，如果为空则说明登录失败，返回错误结果
        if(jwt == null){
            log.info("请求头token为空，返回未登录信息");
            R error = R.failed("NOT_LOGIN");
            //手动转换对象-> json，使用阿里巴巴fastJSON
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }

        //3.判断token是否合法，如果不合法则说明登录失败，返回错误结果
        try {
            Claims claims = JwtUtils.parseJWT(jwt);
            Long userId = Long.valueOf(claims.get("id").toString());
            BaseContext.setCurrentId(userId);
            log.info("当前员工id：{}", userId);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("令牌不合法，返回未登录信息");
            R error = R.failed("NOT_LOGIN");
            //手动转换对象-> json，使用阿里巴巴fastJSON
            String notLogin = JSONObject.toJSONString(error);
            response.getWriter().write(notLogin);
            return false;
        }
        //令牌合法，放行
        log.info("令牌合法，放行");
        System.out.println("preHandle...");
        return true;
    }

}
