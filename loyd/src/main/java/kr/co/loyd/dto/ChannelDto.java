package kr.co.loyd.dto;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public class ChannelDto extends Pageable {
    private Integer channel_id;
    private String channel_name;
    private String create_at;
    private String closed_at;

    public ChannelDto() {

    }

    public ChannelDto(String channel_name) {
        this.channel_name = channel_name;
    }

    public Integer getChannel_id() {
        return channel_id;
    }

    public ChannelDto setChannel_id(Integer channel_id) {
        this.channel_id = channel_id;
        return this;
    }

    public String getChannel_name() {
        return channel_name;
    }

    public ChannelDto setChannel_name(String channel_name) {
        this.channel_name = channel_name;
        return this;
    }

    public String getCreate_at() {
        return create_at;
    }

    public ChannelDto setCreate_at(String create_at) {
        this.create_at = create_at;
        return this;
    }

    public String getClosed_at() {
        return closed_at;
    }

    public ChannelDto setClosed_at(String closed_at) {
        this.closed_at = closed_at;
        return this;
    }
}
