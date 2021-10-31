package kr.co.loyd.socket.message;


import kr.co.loyd.socket.channel.Event;
import kr.co.loyd.socket.util.JsonUtils;
import org.springframework.web.socket.TextMessage;

import java.util.HashMap;
import java.util.Map;

/**
 * 웹 소켓 서버에서 보낼
 * 특정 유형의 메세지를 정의합니다.
 * */
public class WebSocketMessages {

    public static TextMessage reply(String reply) {
        Map<String, String> messageObject = new HashMap();
        messageObject.put("type", "reply");
        messageObject.put("message", reply);
        return new TextMessage(JsonUtils.toJson(messageObject));
    }

    public static TextMessage error(String error) {
        Map<String, String> messageObject = new HashMap();
        messageObject.put("error", "error");
        messageObject.put("message", error);
        return new TextMessage(JsonUtils.toJson(messageObject));
    }

    public static TextMessage failure(String failure) {
        Map<String, String> messageObject = new HashMap();
        messageObject.put("type", "failure");
        messageObject.put("message", failure);
        return new TextMessage(JsonUtils.toJson(messageObject));
    }

    public static TextMessage channelMessage(String channel, Event event, Object payload) {
        Map<String, Object> messageObject = new HashMap();
        messageObject.put("type", "message");
        messageObject.put("do", event.name());
        messageObject.put("channel", channel);
        messageObject.put("payload", payload);
        return new TextMessage(JsonUtils.toJson(messageObject));
    }

}
