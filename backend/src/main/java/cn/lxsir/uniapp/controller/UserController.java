package cn.lxsir.uniapp.controller;

import cn.lxsir.uniapp.entity.User;
import cn.lxsir.uniapp.entity.UserInfo;
import cn.lxsir.uniapp.service.SmsService;
import cn.lxsir.uniapp.service.UserInfoService;
import cn.lxsir.uniapp.service.UserService;
import cn.lxsir.uniapp.utils.BaseContext;
import cn.lxsir.uniapp.utils.JwtUtils;
import cn.lxsir.uniapp.utils.MD5Utils;
import cn.lxsir.uniapp.utils.ValidateCodeUtils;
import cn.lxsir.uniapp.vo.RecyleInfoVo;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpRequest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    SmsService smsService;

    @Autowired
    UserService userService;

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    private RedisTemplate redisTemplate;

    @PostMapping("/login")
    public R login(@RequestBody User user) {
        String phone = user.getPhone();

        User one = userService.getOne(new QueryWrapper<User>().eq("phone", phone));
        String formPass = MD5Utils.inputPassToFormPass(user.getPassword());
        if(one == null){
            return R.failed("登录失败");
        }

        if(!one.getPassword().equals(formPass)){
            return R.failed("登录失败");
        }

        Map<String, Object> claims = new HashMap<>();
        claims.put("id", one.getUserId());
        claims.put("phone", one.getPhone());
        //生成jwt令牌
        String jwt = JwtUtils.generateJwt(claims);
        return R.ok(jwt);
    }

    @PostMapping("/register")
    @Transactional(rollbackFor = Exception.class)
    public R register(@RequestBody Map map) {
        String phone = map.get("phone").toString();

        Object code = redisTemplate.opsForValue().get(phone);

        if(code != null && code.equals(map.get("code"))){
            User user = userService.getOne(new QueryWrapper<User>().eq("phone", phone));

            if(user == null){
                user = new User();
                user.setPhone(phone);
                user.setUserState(0);
                String password = map.get("password").toString();
                user.setPassword(MD5Utils.inputPassToFormPass(password));
                user.setCreateTime(LocalDateTime.now());
                user.setModifiedTime(LocalDateTime.now());
                userService.save(user);

                UserInfo userInfo = new UserInfo();
                userInfo.setPhone(phone);
                userInfo.setUserId(user.getUserId());
                userInfo.setNickname("微信用户");
                userInfo.setRegisterTime(LocalDateTime.now());
                userInfoService.save(userInfo);
            }else{
                return R.failed("已经注册");
            }

            redisTemplate.delete(phone);

            return R.ok(user);
        }
        return R.failed("验证码错误失败");
    }

    @GetMapping("/state")
    public R getUserState(@RequestParam("userId") Integer userId){
        User byId = userService.getById(userId);
        return R.ok(byId);
    }

    @PostMapping("/sendMsg")
    public R sendMsg(@RequestBody User userLogin){
        String phone = userLogin.getPhone();
        if(!StringUtils.isEmpty(phone)){
            String code = ValidateCodeUtils.generateValidateCode(4).toString();
            if(smsService.sendSms(phone, code)){
                redisTemplate.opsForValue().set(phone, code, 5, TimeUnit.MINUTES);
                return R.ok("短信发送成功");
            }
        }
        return R.failed("短信发送失败");
    }

    @GetMapping("/info")
    public R getUserInfo(){
        UserInfo userInfo = userInfoService.getOne(new QueryWrapper<UserInfo>().eq("user_id", BaseContext.getCurrentId()));
        if(userInfo != null){
            return R.ok(userInfo);
        }
        return R.failed("查询错误！");
    }

    @GetMapping("/status")
    public R getUser(@RequestParam Integer userId){
        User byId = userService.getById(userId);
        if(byId != null){
            return R.ok(byId);
        }
        return R.failed("查询失败");
    }

    @PutMapping
    public R changeUserInfo(@RequestBody UserInfo userInfo){
        if(userInfoService.update(userInfo, new QueryWrapper<UserInfo>().eq("user_id", userInfo.getUserId()))){
            return R.ok("修改成功");
        }
        return R.failed("修改失败");
    }

    @PostMapping("/logout")
    public R logout(HttpSession session){
        session.removeAttribute("user");
        return R.ok("退出成功!");
    }


    @GetMapping("/{id}")
    public R getRecyleInfo(@PathVariable("id") Integer id){

        RecyleInfoVo recyleInfoVo = new RecyleInfoVo();

        UserInfo user_id = userInfoService.getOne(new QueryWrapper<UserInfo>().eq("user_id", id));
        recyleInfoVo.setName(user_id.getNickname());
        recyleInfoVo.setPhone(user_id.getPhone());
        recyleInfoVo.setImage(user_id.getAvatar());

        return R.ok(recyleInfoVo);
    }
}
