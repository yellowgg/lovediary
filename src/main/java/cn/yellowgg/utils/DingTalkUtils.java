package cn.yellowgg.utils;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;

import java.io.IOException;

/**
 * @Description: 钉钉机器人 代替告警
 * @Author: yellowgg
 * @Date: Created in 2020/3/16 18:00
 */
public class DingTalkUtils {

    public static final String URL = "";

    /**
     * 发普通消息
     *
     * @param msg
     * @param hookUrl
     * @throws IOException
     */
    public static void sendTextMsg(String msg, String hookUrl) throws IOException {
        TextMsg textMsg = new TextMsg(new Content(msg));
        HttpClient httpClient = HttpClients.createDefault();
        HttpPost httppost = new HttpPost(hookUrl);
        httppost.addHeader("Content-Type", "application/json; charset=utf-8");
        StringEntity se = new StringEntity(JsonUtils.objToJson(textMsg, TextMsg.class), "utf-8");
        httppost.setEntity(se);
        httpClient.execute(httppost);
    }

    public static class Content {
        public String content;

        public Content(String content) {
            this.content = content;
        }
    }

    public static class TextMsg {
        public String msgtype;
        public Content text;

        public TextMsg(Content text) {
            this.msgtype = "text";
            this.text = text;
        }
    }
}
