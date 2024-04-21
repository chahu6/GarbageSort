package cn.lxsir.uniapp.service.impl;

import cn.lxsir.uniapp.entity.Order;
import cn.lxsir.uniapp.mapper.OrderMapper;
import cn.lxsir.uniapp.service.OrderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {

}
