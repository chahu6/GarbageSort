package com.ruoyi.project.garbagesort.orders.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 订单查询对象 orders
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public class Orders extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单号 */
    private Long id;

    /** 用户 */
    @Excel(name = "用户")
    private Long userId;

    /** 回收员id */
    @Excel(name = "回收员id")
    private Long recyclerId;

    /** 预估重量 */
    @Excel(name = "预估重量")
    private String estimateWeight;

    /** 订单回收地址 */
    @Excel(name = "订单回收地址")
    private String address;

    /** 电话号码 */
    @Excel(name = "电话号码")
    private String phone;

    /** 垃圾类型 */
    @Excel(name = "垃圾类型")
    private String type;

    /** 订单状态 1:待接单，2:已完成，3:已取消，4:已接单 */
    @Excel(name = "订单状态 1:待接单，2:已完成，3:已取消，4:已接单")
    private Long status;

    /** 预约时间 */
    @Excel(name = "预约时间")
    private String appointmentTime;

    /** 总价 */
    @Excel(name = "总价")
    private BigDecimal amount;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setRecyclerId(Long recyclerId)
    {
        this.recyclerId = recyclerId;
    }

    public Long getRecyclerId()
    {
        return recyclerId;
    }
    public void setEstimateWeight(String estimateWeight)
    {
        this.estimateWeight = estimateWeight;
    }

    public String getEstimateWeight()
    {
        return estimateWeight;
    }
    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getAddress()
    {
        return address;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }
    public void setStatus(Long status)
    {
        this.status = status;
    }

    public Long getStatus()
    {
        return status;
    }
    public void setAppointmentTime(String appointmentTime)
    {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentTime()
    {
        return appointmentTime;
    }
    public void setAmount(BigDecimal amount)
    {
        this.amount = amount;
    }

    public BigDecimal getAmount()
    {
        return amount;
    }
    public void setOrderTime(Date orderTime)
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime()
    {
        return orderTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("recyclerId", getRecyclerId())
            .append("estimateWeight", getEstimateWeight())
            .append("address", getAddress())
            .append("phone", getPhone())
            .append("type", getType())
            .append("status", getStatus())
            .append("appointmentTime", getAppointmentTime())
            .append("amount", getAmount())
            .append("orderTime", getOrderTime())
            .toString();
    }
}
