package com.ruoyi.project.garbagesort.userInfo.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 用户查询对象 users
 * 
 * @author luoxiang
 * @date 2024-04-20
 */
public class Users extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** md5加密的密码 */
    @Excel(name = "md5加密的密码")
    private String password;

    /** 用户类型：0：用户，1：回收员 */
    @Excel(name = "用户类型：0：用户，1：回收员")
    private Long userState;

    /** 修改日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修改日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date modifiedTime;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setUserState(Long userState) 
    {
        this.userState = userState;
    }

    public Long getUserState() 
    {
        return userState;
    }
    public void setModifiedTime(Date modifiedTime) 
    {
        this.modifiedTime = modifiedTime;
    }

    public Date getModifiedTime() 
    {
        return modifiedTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("phone", getPhone())
            .append("password", getPassword())
            .append("userState", getUserState())
            .append("createTime", getCreateTime())
            .append("modifiedTime", getModifiedTime())
            .toString();
    }
}
