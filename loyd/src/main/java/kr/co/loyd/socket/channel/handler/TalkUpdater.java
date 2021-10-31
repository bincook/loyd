package kr.co.loyd.socket.channel.handler;


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
public class TalkUpdater {
    public void onTalkAdded(Integer talkId, IpAddress channel) {
        Map<String, Object> data = new HashMap();
        data.put("talkId", talkId);

        SubscriptionHub.send(String.format("/talk/%s", channel.getIpV4()), Event.CREATE, JsonUtils.toJson(data));
    }

    public void onTalkDeleted(Integer talkId, IpAddress channel) {
        Map<String, Object> data = new HashMap();
        data.put("talkId", talkId);
        data.put("type", "delete");

        SubscriptionHub.send(String.format("/talk/%s", channel.getIpV4()), Event.DELETE, JsonUtils.toJson(data));
    }
}
