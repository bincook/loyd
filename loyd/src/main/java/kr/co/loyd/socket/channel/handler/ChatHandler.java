package kr.co.loyd.socket.channel.handler;

import kr.co.loyd.dao.ChannelDao;
import kr.co.loyd.dto.ChannelDto;
import kr.co.loyd.socket.RealTimeSession;
import kr.co.loyd.socket.channel.annotation.Action;
import kr.co.loyd.socket.channel.annotation.ChannelHandler;
import kr.co.loyd.socket.channel.annotation.ChannelValue;
import kr.co.loyd.socket.channel.SubscriptionHub;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;


/**
 * talk 채널을 관리해줄 수 있는 핸들러 입니다.
 * ChannelHandlerResolver 가
 * 이 어노테이션을 보고, 적절한 핸들러를 찾아줍니다.
 *
 * SubscriptionHub 를 통해, 구독과 해제를 관리해줍니다.
 * */
@ChannelHandler("/chat/*")
public class ChatHandler {
    private static final Logger log = LoggerFactory.getLogger(ChatHandler.class);

    private final ChannelDao channelDao;


    public ChatHandler(SqlSession sqlSession) {
        this.channelDao = sqlSession.getMapper(ChannelDao.class);
    }


    @Action("subscribe")
    public void subscribe(RealTimeSession session, @ChannelValue String channel) {
        log.debug("RealTimeSession[{}] Subscribe to channel `{}`", session.id(), channel);

        // 사용자가 구독한 채널이 있다면 해당 채널을 구독하고 없다면 DB 에서 채널을 조회합니다. 그래도 없다면 새로운 채널을 발행하여 DB 에 채널을 추가합니다.
        List<ChannelDto> channelDtos = channelDao.findByChannelNameAndClosedAtIsNull(channel);

        // 새로운 채널 발행
        if (channelDtos.size() == 0) {
            ChannelDto channelDto = new ChannelDto(channel);
            channelDao.create(channelDto);
            SubscriptionHub.subscribe(session, channelDto.getChannel_name());
            return;
        }

        SubscriptionHub.subscribe(session, channelDtos.get(0).getChannel_name());
    }

    @Action("unsubscribe")
    public void unsubscribe(RealTimeSession session, @ChannelValue String channel) {
        log.debug("RealTimeSession[{}] Unsubscribe from channel `{}`", session.id(), channel);
        SubscriptionHub.unsubscribe(session, channel);
    }
}
