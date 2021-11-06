package kr.co.loyd.dao;

import kr.co.loyd.dto.CartDto;
import kr.co.loyd.dto.ChannelDto;

import java.util.ArrayList;
import java.util.List;

public interface ChannelDao {
    // 전부 조회
    List<ChannelDto> findAll();
    // 채널 이름으로 조회
    List<ChannelDto> findByChannelName(String channel_name);
    ChannelDto findByChannel(Integer channelId);
    List<ChannelDto> findByChannelNameAndClosedAtIsNull(String channel_name);
    List<ChannelDto> findAllWithClosedAtIsNull();
    void create(ChannelDto channelDto);
    void deleteByChannelId(Integer channelId);
    void deleteByChannelNameAndCloseAtIsNotNull(String channel_name);
}
