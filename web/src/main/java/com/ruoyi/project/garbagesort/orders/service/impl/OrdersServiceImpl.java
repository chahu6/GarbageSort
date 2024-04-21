package com.ruoyi.project.garbagesort.orders.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.garbagesort.orders.mapper.OrdersMapper;
import com.ruoyi.project.garbagesort.orders.domain.Orders;
import com.ruoyi.project.garbagesort.orders.service.IOrdersService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 订单查询Service业务层处理
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Service
public class OrdersServiceImpl implements IOrdersService 
{
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询订单查询
     * 
     * @param id 订单查询ID
     * @return 订单查询
     */
    @Override
    public Orders selectOrdersById(Long id)
    {
        return ordersMapper.selectOrdersById(id);
    }

    /**
     * 查询订单查询列表
     * 
     * @param orders 订单查询
     * @return 订单查询
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders)
    {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增订单查询
     * 
     * @param orders 订单查询
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders)
    {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改订单查询
     * 
     * @param orders 订单查询
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders)
    {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 删除订单查询对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteOrdersByIds(String ids)
    {
        return ordersMapper.deleteOrdersByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除订单查询信息
     * 
     * @param id 订单查询ID
     * @return 结果
     */
    @Override
    public int deleteOrdersById(Long id)
    {
        return ordersMapper.deleteOrdersById(id);
    }
}
