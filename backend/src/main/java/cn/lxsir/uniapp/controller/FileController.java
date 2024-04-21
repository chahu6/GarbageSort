package cn.lxsir.uniapp.controller;

import cn.lxsir.uniapp.entity.UserInfo;
import cn.lxsir.uniapp.service.FileService;
import cn.lxsir.uniapp.service.UserInfoService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileService fileService;

    @Autowired
    private UserInfoService userInfoService;

    /**
     * 文件上传接口
     * @param file
     * @return
     */
    @PostMapping("/upload/{userId}")
    @Transactional(rollbackFor = Exception.class)
    public R upload(@RequestPart("file") MultipartFile file, @PathVariable Integer userId){
        String imgFileStr = fileService.upload(file);
        if(imgFileStr.isEmpty()){
            return R.failed("修改失败");
        }

        UserInfo userInfo = new UserInfo();
        userInfo.setAvatar(imgFileStr);
        userInfoService.update(userInfo, new QueryWrapper<UserInfo>().eq("user_id", userId));

        return R.ok(imgFileStr);
    }
}
