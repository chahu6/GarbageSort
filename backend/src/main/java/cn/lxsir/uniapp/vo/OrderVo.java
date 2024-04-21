package cn.lxsir.uniapp.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class OrderVo implements Serializable {
    private static final long serialVersionUID = 1L;

    Integer id;

    Integer userId;

    Integer addrId;

    Integer goodsId;

    String type;

    String status;

    LocalDateTime appointmentTime;

    Double amount;
}
