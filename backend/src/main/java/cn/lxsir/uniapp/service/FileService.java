package cn.lxsir.uniapp.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileService {

    /**
     * 阿里云OSS文件上传
     * @param file
     * @return
     */
    String upload(MultipartFile file);

}