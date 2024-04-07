package cn.lxsir.uniapp.controller;

import cn.lxsir.uniapp.entity.UserLogin;
import cn.lxsir.uniapp.service.SmsService;
import cn.lxsir.uniapp.service.UserService;
import cn.lxsir.uniapp.utils.ValidateCodeUtils;
import com.baomidou.mybatisplus.extension.api.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    SmsService smsService;

    @Autowired
    UserService userService;

    @PostMapping("/login")
    public R login(@RequestBody Map map) {


        return R.ok("userLogin");
    }

    @PostMapping("/sendMsg")
    public R sendMsg(@RequestBody UserLogin userLogin){
        String phone = userLogin.getPhone();
        if(!StringUtils.isEmpty(phone)){
            String code = ValidateCodeUtils.generateValidateCode(4).toString();
            if(smsService.sendSms(phone, code)){
                return R.ok("短信发送成功");
            }
        }
        return R.failed("短信发送失败");
    }
}
