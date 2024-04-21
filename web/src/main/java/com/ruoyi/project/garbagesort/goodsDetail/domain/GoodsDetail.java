package com.ruoyi.project.garbagesort.goodsDetail.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 物品详情查询对象 goods_detail
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public class GoodsDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 物品id */
    private Long id;

    /** 订单号 */
    @Excel(name = "订单号")
    private Long orderId;

    /** 物品名称 */
    @Excel(name = "物品名称")
    private String goodsName;

    /** 物品重量 */
    @Excel(name = "物品重量")
    private Long weight;

    /** 物品单价 */
    @Excel(name = "物品单价")
    private Long amount;

    /** 图片路径 */
    @Excel(name = "图片路径")
    private String image;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setOrderId(Long orderId)
    {
        this.orderId = orderId;
    }

    public Long getOrderId()
    {
        return orderId;
    }
    public void setGoodsName(String goodsName)
    {
        this.goodsName = goodsName;
    }

    public String getGoodsName()
    {
        return goodsName;
    }
    public void setWeight(Long weight)
    {
        this.weight = weight;
    }

    public Long getWeight()
    {
        return weight;
    }
    public void setAmount(Long amount)
    {
        this.amount = amount;
    }

    public Long getAmount()
    {
        return amount;
    }
    public void setImage(String image)
    {
        this.image = image;
    }

    public String getImage()
    {
        return image;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderId", getOrderId())
            .append("goodsName", getGoodsName())
            .append("weight", getWeight())
            .append("amount", getAmount())
            .append("image", getImage())
            .toString();
    }
}
