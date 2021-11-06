package kr.co.loyd.socket.channel.handler;

import kr.co.loyd.socket.channel.Event;
import kr.co.loyd.socket.channel.SubscriptionHub;
import kr.co.loyd.socket.util.JsonUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * 구독 허브를 통해서, 원하는 채널에 원하는 메세지를 보냅니다.
 * */
@Component
public class ChannelUpdater {
    public void onChannelClosed(String channel) {
        SubscriptionHub.send(channel, Event.CLOSE, null);
    }
}
