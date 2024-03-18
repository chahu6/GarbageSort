package cn.lxsir.uniapp.common;


import com.baidu.aip.speech.AipSpeech;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Objects;

@Slf4j
@Service
public class AsrMain {

    @Value("${baidu.speech.appid}")
    String speechAppid;

    @Value("${baidu.speech.apikey}")
    String speechApikey;

    @Value("${baidu.speech.secretkey}")
    String speechSecretkey;

    public String apiSpecch(String fileName) throws Exception {


        AipSpeech client = new AipSpeech(speechAppid, speechApikey, speechSecretkey);

        HashMap<String, Object> options = new HashMap<>();
        options.put("url", "https://vop.baidu.com/pro_api");

        // {"result":["北京科技馆。"],"err_msg":"success.","sn":"335596755691683366583","corpus_no":"7230004422576742714","err_no":0}
        JSONObject res = client.asr(fileName, "m4a", 16000, options);

        int errNo = res.getInt("err_no");
        if (Objects.equals(errNo, 0)) {
            //识别成功
            JSONArray jsonArray = res.getJSONArray("result");

            return jsonArray.getString(0);

        } else {
            //识别失败
            String errMsg = res.getString("err_msg");

            log.error("语音识别失败===={}", errMsg);

            throw new Exception("语音识别失败: " + errMsg);
        }
    }
}
