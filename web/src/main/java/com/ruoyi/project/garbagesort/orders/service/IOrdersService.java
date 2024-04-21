package com.ruoyi.project.garbagesort.orders.service;

import java.util.List;
import com.ruoyi.project.garbagesort.orders.domain.Orders;

/**
 * 订单查询Service接口
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public interface IOrdersService 
{
    /**
     * 查询订单查询
     * 
     * @param id 订单查询ID
     * @return 订单查询
     */
    public Orders selectOrdersById(Long id);

    /**
     * 查询订单查询列表
     * 
     * @param orders 订单查询
     * @return 订单查询集合
     */
    public List<Orders> selectOrdersList(Orders orders);

    /**
     * 新增订单查询
     * 
     * @param orders 订单查询
     * @return 结果
     */
    public int insertOrders(Orders orders);

    /**
     * 修改订单查询
     * 
     * @param orders 订单查询
     * @return 结果
     */
    public int updateOrders(Orders orders);

    /**
     * 批量删除订单查询
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrdersByIds(String ids);

    /**
     * 删除订单查询信息
     * 
     * @param id 订单查询ID
     * @return 结果
     */
    public int deleteOrdersById(Long id);
}
