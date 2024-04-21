package cn.lxsir.uniapp.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("recyle_info")
public class RecyleInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer recyleId;

    private Integer userId;

    private String name;

    private String phone;

    private String address;

    private LocalDateTime orderTime;
}

