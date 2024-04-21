package cn.lxsir.uniapp.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class RecyleInfoVo implements Serializable {
    private static final long serialVersionUID = 1L;

    private String name;
    private String phone;
    private String image;

}
