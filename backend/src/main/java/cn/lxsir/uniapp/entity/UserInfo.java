package cn.lxsir.uniapp.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@TableName("user_inf")
public class UserInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "inf_id", type = IdType.AUTO)
    private Integer infId;

    /**
     * 用户名称
     */
    @TableField("user_id")
    private Integer userId;

    @TableField("nickname")
    private String nickname;

    @TableField("avatar")
    private String avatar;

    @TableField("phone")
    private String phone;

    @TableField("gender")
    private String gender;

    @TableField("user_money")
    private Integer userMoney;

    @TableField("order_num")
    private Integer orderNum;

    @TableField(value = "register_time", fill = FieldFill.INSERT)
    private LocalDateTime registerTime;
}
