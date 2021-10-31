package kr.co.loyd.socket.channel.handler;

import kr.co.loyd.socket.RealTimeSession;
import kr.co.loyd.socket.channel.annotation.Action;
import kr.co.loyd.socket.channel.annotation.ChannelHandler;
import kr.co.loyd.socket.channel.annotation.ChannelValue;
import kr.co.loyd.socket.channel.SubscriptionHub;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * talk 채널을 관리해줄 수 있는 핸들러 입니다.
 * ChannelHandlerResolver 가
 * 이 어노테이션을 보고, 적절한 핸들러를 찾아줍니다.
 *
 * SubscriptionHub 를 통해, 구독과 해제를 관리해줍니다.
 * */
@ChannelHandler("/talk/*")
public class TalkHandler {
    private static final Logger log = LoggerFactory.getLogger(TalkHandler.class);

    @Action("subscribe")
    public void subscribe(RealTimeSession session, @ChannelValue String channel) {
        log.debug("RealTimeSession[{}] Subscribe to channel `{}`", session.id(), channel);
        SubscriptionHub.subscribe(session, channel);
    }

    @Action("unsubscribe")
    public void unsubscribe(RealTimeSession session, @ChannelValue String channel) {
        log.debug("RealTimeSession[{}] Unsubscribe from channel `{}`", session.id(), channel);
        SubscriptionHub.unsubscribe(session, channel);
    }
}
