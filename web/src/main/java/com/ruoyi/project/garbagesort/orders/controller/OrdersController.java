package com.ruoyi.project.garbagesort.orders.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.garbagesort.orders.domain.Orders;
import com.ruoyi.project.garbagesort.orders.service.IOrdersService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.web.page.TableDataInfo;

/**
 * 订单查询Controller
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
@Controller
@RequestMapping("/garbagesort/orders")
public class OrdersController extends BaseController
{
    private String prefix = "garbagesort/orders";

    @Autowired
    private IOrdersService ordersService;

    @RequiresPermissions("garbagesort:orders:view")
    @GetMapping()
    public String orders()
    {
        return prefix + "/orders";
    }

    /**
     * 查询订单查询列表
     */
    @RequiresPermissions("garbagesort:orders:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Orders orders)
    {
        startPage();
        List<Orders> list = ordersService.selectOrdersList(orders);
        return getDataTable(list);
    }

    /**
     * 导出订单查询列表
     */
    @RequiresPermissions("garbagesort:orders:export")
    @Log(title = "订单查询", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        return util.exportExcel(list, "订单查询数据");
    }

    /**
     * 新增订单查询
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单查询
     */
    @RequiresPermissions("garbagesort:orders:add")
    @Log(title = "订单查询", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Orders orders)
    {
        return toAjax(ordersService.insertOrders(orders));
    }

    /**
     * 修改订单查询
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Orders orders = ordersService.selectOrdersById(id);
        mmap.put("orders", orders);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单查询
     */
    @RequiresPermissions("garbagesort:orders:edit")
    @Log(title = "订单查询", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Orders orders)
    {
        return toAjax(ordersService.updateOrders(orders));
    }

    /**
     * 删除订单查询
     */
    @RequiresPermissions("garbagesort:orders:remove")
    @Log(title = "订单查询", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(ordersService.deleteOrdersByIds(ids));
    }
}
