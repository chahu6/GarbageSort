package cn.lxsir.uniapp.service.impl;

import cn.lxsir.uniapp.entity.UserAddress;
import cn.lxsir.uniapp.mapper.UserAddressMapper;
import cn.lxsir.uniapp.service.UserAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class UserAddressServiceImpl extends ServiceImpl<UserAddressMapper, UserAddress> implements UserAddressService {
}
