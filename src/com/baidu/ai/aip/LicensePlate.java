

package com.baidu.ai.aip;
//
import com.baidu.ai.aip.Base64Util;
import com.baidu.ai.aip.FileUtil;
import com.baidu.ai.aip.HttpUtil;

import net.sf.json.JSONObject;

import java.net.URLEncoder;

/**
* ����ʶ��
*/
public class LicensePlate {

    public static String licensePlate() {
        // ����url
        String url = "https://aip.baidubce.com/rest/2.0/ocr/v1/license_plate";
        try {
            // �����ļ�·��
            String filePath = "C:\\Users\\Administrator\\Desktop\\ren\\car\\chuan.jpg";
            byte[] imgData = FileUtil.readFileByBytes(filePath);
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");

            String param = "image=" + imgParam;

            // ע�������Ϊ�˼򻯱���ÿһ������ȥ��ȡaccess_token�����ϻ���access_token�й���ʱ�䣬 �ͻ��˿����л��棬���ں����»�ȡ��
            String accessToken = "24.cc4347440aeb686a33d1fb79f6b23db4.2592000.1593245884.282335-20110513";

            String result = HttpUtil.post(url, accessToken, param);
            System.out.println(result);
            JSONObject object=JSONObject.fromObject(result);
            System.out.println(object.getJSONObject("words_result").get("number"));
            System.out.println(object.getJSONObject("words_result").get("color"));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        LicensePlate.licensePlate();
    }
}