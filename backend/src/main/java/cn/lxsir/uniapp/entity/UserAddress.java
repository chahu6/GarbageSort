package cn.lxsir.uniapp.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@TableName("user_addr")
public class UserAddress implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "addr_id", type = IdType.AUTO)
    private Integer addrId;

    @TableField("user_id")
    private Integer userId;

    @TableField("contact_name")
    private String contactName;

    @TableField("contact_phone")
    private String contactPhone;

    @TableField("province")
    private String province;

    @TableField("city")
    private String city;

    @TableField("district")
    private String district;

    @TableField("address")
    private String address;

    @TableField("is_default")
    private Integer isDefault;

    @TableField(value = "modified_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime modifiedTime;
}
