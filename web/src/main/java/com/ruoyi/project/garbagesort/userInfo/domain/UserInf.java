package com.ruoyi.project.garbagesort.userInfo.domain;

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 用户信息查询对象 user_inf
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public class UserInf extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户信息ID */
    private Long infId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickname;

    /** 头像 */
    @Excel(name = "头像")
    private String avatar;

    /** 电话号码 */
    @Excel(name = "电话号码")
    private String phone;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 用户余额 */
    @Excel(name = "用户余额")
    private BigDecimal userMoney;

    /** 订单数量 */
    @Excel(name = "订单数量")
    private Long orderNum;

    /** 注册时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "注册时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date registerTime;

    /** 用户查询信息 */
    private List<Users> usersList;

    public void setInfId(Long infId)
    {
        this.infId = infId;
    }

    public Long getInfId()
    {
        return infId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setNickname(String nickname)
    {
        this.nickname = nickname;
    }

    public String getNickname()
    {
        return nickname;
    }
    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getAvatar()
    {
        return avatar;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getGender()
    {
        return gender;
    }
    public void setUserMoney(BigDecimal userMoney)
    {
        this.userMoney = userMoney;
    }

    public BigDecimal getUserMoney()
    {
        return userMoney;
    }
    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
    }
    public void setRegisterTime(Date registerTime)
    {
        this.registerTime = registerTime;
    }

    public Date getRegisterTime()
    {
        return registerTime;
    }

    public List<Users> getUsersList()
    {
        return usersList;
    }

    public void setUsersList(List<Users> usersList)
    {
        this.usersList = usersList;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("infId", getInfId())
            .append("userId", getUserId())
            .append("nickname", getNickname())
            .append("avatar", getAvatar())
            .append("phone", getPhone())
            .append("gender", getGender())
            .append("userMoney", getUserMoney())
            .append("orderNum", getOrderNum())
            .append("registerTime", getRegisterTime())
            .append("usersList", getUsersList())
            .toString();
    }
}
