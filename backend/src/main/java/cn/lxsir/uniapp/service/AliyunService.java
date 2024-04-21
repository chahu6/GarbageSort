package cn.lxsir.uniapp.service;

import java.util.Map;

public interface AliyunService {
    Map<String, Object> imageClassify(String fileName) throws Exception;
}
