package kr.co.loyd.socket.channel.handler;


import kr.co.loyd.dto.ChatDto;
import kr.co.loyd.socket.channel.Event;
import kr.co.loyd.socket.channel.SubscriptionHub;
import kr.co.loyd.socket.model.IpAddress;
import kr.co.loyd.socket.util.JsonUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * 구독 허브를 통해서, 원하는 채널에 원하는 메세지를 보냅니다.
 * */
@Component
public class ChatUpdater {
    public void onChatAdded(String channel, ChatDto chatDto) {
        Map<String, Object> data = new HashMap();
        data.put("type", "create");
        data.put("chat_id", chatDto.getChat_id());
        data.put("content", chatDto.getContent());
        data.put("is_admin", chatDto.isAdmin());
        data.put("create_at", chatDto.getCreate_at());

        SubscriptionHub.send(channel, Event.CREATE, JsonUtils.toJson(data));
    }

    public void onChatDeleted(String channel, ChatDto chatDto) {
        Map<String, Object> data = new HashMap();
        data.put("chat_id", chatDto.getChat_id());
        data.put("type", "delete");

        SubscriptionHub.send(channel, Event.DELETE, JsonUtils.toJson(data));
    }
}
