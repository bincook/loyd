package kr.co.loyd.dao;

import kr.co.loyd.dto.ChannelDto;
import kr.co.loyd.dto.ChatDto;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

public interface ChatDao {
    List<ChatDto> findAll();
    List<ChatDto> findByCreater(String creater);
    ChatDto findByChatId(Integer chat_id);
    List<ChatDto> findByChannelAndDeletedAtIsNull(ChatDto chatDto);
    List<ChatDto> findAllDeletedAtIsNull();
    void create(ChatDto chatDto);
    void deleteByChatId(Integer chatId);
}
