package cn.lxsir.uniapp.service.impl;

import cn.lxsir.uniapp.service.AliyunService;
import com.aliyun.imagerecog20190930.models.ClassifyingRubbishResponse;
import com.aliyun.tea.TeaException;
import com.aliyun.tea.TeaModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class AliyunServiceImpl implements AliyunService {

    @Value("${aliyun.image.accessKeyId}")
    String accessKeyId;

    @Value("${aliyun.image.accessKeySecret}")
    String accessKeySecret;

    public static com.aliyun.imagerecog20190930.Client createClient(String accessKeyId, String accessKeySecret) throws Exception {
        // 工程代码泄露可能会导致 AccessKey 泄露，并威胁账号下所有资源的安全性。以下代码示例仅供参考。
        // 建议使用更安全的 STS 方式，更多鉴权访问方式请参见：https://help.aliyun.com/document_detail/378657.html。
        com.aliyun.teaopenapi.models.Config config = new com.aliyun.teaopenapi.models.Config()
                // 必填，请确保代码运行环境设置了环境变量 ALIBABA_CLOUD_ACCESS_KEY_ID。
                .setAccessKeyId(accessKeyId)
                // 必填，请确保代码运行环境设置了环境变量 ALIBABA_CLOUD_ACCESS_KEY_SECRET。
                .setAccessKeySecret(accessKeySecret);
        // Endpoint 请参考 https://api.aliyun.com/product/imagerecog
        config.endpoint = "imagerecog.cn-shanghai.aliyuncs.com";
        return new com.aliyun.imagerecog20190930.Client(config);
    }

    @Override
    public Map<String, Object> imageClassify(String fileName) {
        com.aliyun.imagerecog20190930.Client client = null;
        try {
            client = AliyunServiceImpl.createClient(accessKeyId, accessKeySecret);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        com.aliyun.imagerecog20190930.models.ClassifyingRubbishRequest classifyingRubbishRequest = new com.aliyun.imagerecog20190930.models.ClassifyingRubbishRequest()
                .setImageURL(fileName);
        com.aliyun.teautil.models.RuntimeOptions runtime = new com.aliyun.teautil.models.RuntimeOptions();
        try {
            ClassifyingRubbishResponse classifyingRubbishResponse = client.classifyingRubbishWithOptions(classifyingRubbishRequest, runtime);
            // 获取整体结果
            System.out.println(com.aliyun.teautil.Common.toJSONString(TeaModel.buildMap(classifyingRubbishResponse)));
            // 获取单个字段
            System.out.println(classifyingRubbishResponse.getBody());
        } catch (TeaException teaException) {
            // 获取整体报错信息
            System.out.println(com.aliyun.teautil.Common.toJSONString(teaException));
            // 获取单个字段
            System.out.println(teaException.getCode());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
