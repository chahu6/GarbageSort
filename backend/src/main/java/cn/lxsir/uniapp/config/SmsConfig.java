package cn.lxsir.uniapp.config;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SmsConfig {
    @Value("${aliyun.sms.accessKeyId}")
    private String accessKeyId;
    @Value("${aliyun.sms.accessKeySecret}")
    private String accessKeySecret;
    @Value("${aliyun.sms.signName}")
    private String signName;
    @Value("${aliyun.sms.templateCode}")
    private String templateCode;

    @Bean
    public IAcsClient acsClient(){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        return new DefaultAcsClient(profile);
    }

    @Bean
    public String signName() {
        return signName;
    }

    @Bean
    public String templateCode() {
        return templateCode;
    }
}
