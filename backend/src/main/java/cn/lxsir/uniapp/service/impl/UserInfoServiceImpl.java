package cn.lxsir.uniapp.service.impl;


import cn.lxsir.uniapp.entity.UserInfo;
import cn.lxsir.uniapp.mapper.UserInfoMapper;
import cn.lxsir.uniapp.service.UserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {
}
