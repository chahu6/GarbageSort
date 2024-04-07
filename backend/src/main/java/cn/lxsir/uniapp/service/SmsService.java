package cn.lxsir.uniapp.service;

import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SmsService {
    @Resource
    private IAcsClient client;
    @Resource
    private String signName;
    @Resource
    private String templateCode;

    public boolean sendSms(String phoneNumbers, String templateParam) {
        try {
            SendSmsRequest request = new SendSmsRequest();
            request.setSysRegionId("cn-hangzhou");
            request.setPhoneNumbers(phoneNumbers);
            request.setSignName(signName);
            request.setTemplateCode(templateCode);
            request.setTemplateParam("{\"code\":\""+templateParam+"\"}");

            SendSmsResponse response = client.getAcsResponse(request);
            if(response.getCode() != null && response.getCode().equals("OK")){
                return true;
            }else {
                return false;
            }
        } catch (Exception e) {
            throw new RuntimeException("短信发送异常！");
        }
    }
}
