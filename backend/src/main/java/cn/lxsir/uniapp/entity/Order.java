package cn.lxsir.uniapp.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("orders")
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    Integer id;

    @TableField("user_id")
    Integer userId;

    @TableField("recycler_id")
    Integer recyclerId;

    @TableField("estimate_weight")
    String estimateWeight;

    @TableField("address")
    String address;

    @TableField("phone")
    String phone;

    @TableField("type")
    String type;

    @TableField("status")
    Integer status;

    @TableField("appointment_time")
    String appointmentTime;

    @TableField("amount")
    Double amount;

    @TableField(value = "order_time", fill = FieldFill.INSERT)
    LocalDateTime orderTime;
}
