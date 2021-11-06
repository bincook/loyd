package kr.co.loyd.socket.controller;

import kr.co.loyd.dao.ChannelDao;
import kr.co.loyd.dao.ChatDao;
import kr.co.loyd.dao.OrderDao;
import kr.co.loyd.dto.ChannelDto;
import kr.co.loyd.dto.ChatDto;
import kr.co.loyd.dto.OrderDto;
import kr.co.loyd.socket.channel.handler.ChannelUpdater;
import kr.co.loyd.socket.channel.handler.ChatUpdater;
import kr.co.loyd.socket.message.Error;
import org.apache.ibatis.session.SqlSession;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/channel")
public class ChatController {
    private final ChatDao chatDao;
    private final ChannelDao channelDao;
    private final ChatUpdater chatUpdater;
    private final ChannelUpdater channelUpdater;

    public ChatController(SqlSession sqlSession, ChatUpdater chatUpdater, ChannelUpdater channelUpdater) {
        this.channelDao = sqlSession.getMapper(ChannelDao.class);
        this.chatDao = sqlSession.getMapper(ChatDao.class);
        this.chatUpdater = chatUpdater;
        this.channelUpdater = channelUpdater;
    }

    // 채팅 리스트
    @RequestMapping(value = "/{channel}/chat", method = RequestMethod.GET)
    public @ResponseBody List<ChatDto> getChatList(
            @RequestParam(value = "page", defaultValue = "0") Integer page,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            @PathVariable(value = "channel") String channel) {

        String channelName = "/chat/" + channel;

        List<ChannelDto> channels = channelDao.findByChannelNameAndClosedAtIsNull(channelName);

        if (channels.size() == 0)
            throw new IllegalArgumentException(Error.thereAreNoChannel.parseMessage());

        ChatDto chatDto = new ChatDto();
        chatDto.setChannel_id(channels.get(0).getChannel_id());
        chatDto.setPage(page);
        chatDto.setSize(size);

        return chatDao.findByChannelAndDeletedAtIsNull(chatDto);
    }

    @RequestMapping(value = "/{channel}/chat", method = RequestMethod.POST)
    public @ResponseBody ResponseEntity createChat(@RequestBody ChatDto chatDto, @PathVariable(value = "channel") String channel) {

        List<ChannelDto> findChannels = channelDao.findByChannelNameAndClosedAtIsNull("/chat/" + channel);

        // 채널 아이디가 없는 경우
        if (findChannels.size() < 1)
            throw new IllegalArgumentException(Error.invalidParameter.parseMessage("channel_id"));

        // 이미 종료된 채널의 경우
        if (findChannels.get(0).getClosed_at() != null)
            throw new RuntimeException(Error.thereAreNoChannel.parseMessage());

        chatDto.setChannel_id(findChannels.get(0).getChannel_id());
        chatDao.create(chatDto);

        ChatDto chat = chatDao.findByChatId(chatDto.getChat_id());

        // 같은 채널의 다른이에게 이벤트
        chatUpdater.onChatAdded(findChannels.get(0).getChannel_name(), chat);
        return ResponseEntity.ok().build();
    }

    @RequestMapping(value = "/chat/{chat}", method = RequestMethod.DELETE)
    public @ResponseBody ResponseEntity deleteChat(@PathVariable(value = "chat") Integer chatId) {

        ChatDto chatDto = chatDao.findByChatId(chatId);

        if (chatDto == null)
            throw new IllegalArgumentException(Error.invalidParameter.parseMessage("chatId"));

        chatDao.deleteByChatId(chatId);
        return ResponseEntity.ok().build();
    }

    @RequestMapping(value = "/close/{channel}", method = RequestMethod.POST)
    public @ResponseBody ResponseEntity closeChannel(@PathVariable(value = "channel") String channel) {
        // 채널 아이디가 없는 경우
        if (channel == null)
            throw new IllegalArgumentException(Error.invalidParameter.parseMessage("channel"));

        String channelName = "/chat/" + channel;

        List<ChannelDto> findChannel = channelDao.findByChannelName(channelName);

        if (findChannel.size() < 1)
            throw new RuntimeException(Error.thereAreNoChannel.parseMessage());

        channelDao.deleteByChannelId(findChannel.get(0).getChannel_id());
        channelUpdater.onChannelClosed(channelName);
        return ResponseEntity.ok().build();
    }

}
