package cn.lxsir.uniapp.service.impl;

import cn.lxsir.uniapp.service.AliyunService;
import com.aliyun.com.viapi.FileUtils;
import com.aliyun.imagerecog20190930.models.ClassifyingRubbishResponse;
import com.aliyun.tea.TeaException;
import com.aliyun.tea.TeaModel;
import com.aliyuncs.exceptions.ClientException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.HashMap;
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

    private String LocalFileToOss(String filename) throws ClientException, IOException {
        // 创建AccessKey ID和AccessKey Secret，请参考https://help.aliyun.com/document_detail/175144.html。
        // 如果您使用的是RAM用户的AccessKey，还需要为RAM用户授予权限AliyunVIAPIFullAccess，请参考https://help.aliyun.com/document_detail/145025.html。
        // 从环境变量读取配置的AccessKey ID和AccessKey Secret。运行代码示例前必须先配置环境变量。
//        String accessKeyId = System.getenv("ALIBABA_CLOUD_ACCESS_KEY_ID");
//        String accessKeySecret = System.getenv("ALIBABA_CLOUD_ACCESS_KEY_SECRET");
        // 场景一，使用本地文件
//        String file = "/tmp/bankCard.png";
        // 场景二，使用任意可访问的url
        // String file = "https://viapi-test-bj.oss-cn-beijing.aliyuncs.com/viapi-3.0domepic/ocr/RecognizeBankCard/yhk1.jpg";
        FileUtils fileUtils = FileUtils.getInstance(accessKeyId, accessKeySecret);
        String ossUrl = fileUtils.upload(filename);
        // 生成的url，可用于调用视觉智能开放平台的能力
        System.out.println(ossUrl);

        return ossUrl;
    }


    @Override
    public Map<String, Object> imageClassify(String fileName) {

        String ossUrl = null;
        try {
            ossUrl = LocalFileToOss(fileName);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        com.aliyun.imagerecog20190930.Client client = null;
        try {
            client = AliyunServiceImpl.createClient(accessKeyId, accessKeySecret);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        com.aliyun.imagerecog20190930.models.ClassifyingRubbishRequest classifyingRubbishRequest = new com.aliyun.imagerecog20190930.models.ClassifyingRubbishRequest()
                .setImageURL(ossUrl);
        com.aliyun.teautil.models.RuntimeOptions runtime = new com.aliyun.teautil.models.RuntimeOptions();
        Map<String, Object> result = new HashMap<>();
        try {
            ClassifyingRubbishResponse classifyingRubbishResponse = client.classifyingRubbishWithOptions(classifyingRubbishRequest, runtime);
            // 获取整体结果
//            System.out.println(com.aliyun.teautil.Common.toJSONString(TeaModel.buildMap(classifyingRubbishResponse)));
//            System.out.println(classifyingRubbishResponse.getBody());
            result = TeaModel.buildMap(classifyingRubbishResponse.getBody().getData());
        } catch (TeaException teaException) {
            // 获取整体报错信息
            System.out.println(com.aliyun.teautil.Common.toJSONString(teaException));
            // 获取单个字段
            System.out.println(teaException.getCode());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
