package com.multi.withPuppy.communities;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class GreenEyeApiExample {

    private static final String CLIENT_ID = "team1";
    private static final String CLIENT_SECRET = "UHNhaVZoTHlNcWJLdHBGYXNoRWJUckN0ZmtGS2VMSHM=";

    public static void main(String[] args) throws IOException {
        String fileUrl = "####"; // 이미지 파일 URL
        InputStream is = null;
        File imageFile = new File(fileUrl);
        
        HttpClient client = HttpClients.createDefault();
        String apiUrl = "https://openapi.naver.com/v1/vision/celebrity";
        
        HttpPost httpPost = new HttpPost(apiUrl);
        httpPost.setHeader("X-Naver-Client-Id", CLIENT_ID);
        httpPost.setHeader("X-Naver-Client-Secret", CLIENT_SECRET);
        
        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
        
        builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        builder.addBinaryBody("image", imageFile, ContentType.create("multipart/form-data"), imageFile.getName());

        HttpEntity entity = builder.build();
        httpPost.setEntity(entity);
        
        HttpResponse response = client.execute(httpPost);
        HttpEntity resEntity = response.getEntity();
        
        if (resEntity != null) {
            String responseData = EntityUtils.toString(resEntity);
            
            JSONObject json = new JSONObject(responseData);
            JSONArray faces = json.getJSONArray("faces");
            
            if (faces.length() > 0) {
                JSONObject celebrity = faces.getJSONObject(0).getJSONArray("celebrity").getJSONObject(0);
                String name = celebrity.getString("value");
                double confidence = celebrity.getDouble("confidence");
                
                if (confidence > 0.5) { // 신뢰도 50% 이상이면 해당 이름으로 인식한 것이라고 판단
                    System.out.println(name + " is detected in the image with confidence " + confidence);
                } else {
                    System.out.println("No celebrity is detected or low confidence on the detection result.");
                }
            } else {
                System.out.println("No face is detected.");
            }
        }
    }
}

