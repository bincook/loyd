package kr.co.loyd.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public class ChatDto extends Pageable {
    private Integer chat_id;
    private Integer channel_id;
    private String creater;
    private String content;
    private String create_at;
    private String deleted_at;
    private String is_admin;

    public Integer getChat_id() {
        return chat_id;
    }

    public ChatDto setChat_id(Integer chat_id) {
        this.chat_id = chat_id;
        return this;
    }

    public Integer getChannel_id() {
        return channel_id;
    }

    public ChatDto setChannel_id(Integer channel_id) {
        this.channel_id = channel_id;
        return this;
    }

    public String getCreater() {
        return creater;
    }

    public ChatDto setCreater(String creater) {
        this.creater = creater;
        return this;
    }

    public String getContent() {
        return content;
    }

    public ChatDto setContent(String content) {
        this.content = content;
        return this;
    }

    public String getCreate_at() {
        return create_at;
    }

    public ChatDto setCreate_at(String create_at) {
        this.create_at = create_at;
        return this;
    }

    public String getDeleted_at() {
        return deleted_at;
    }

    public ChatDto setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
        return this;
    }

    public String getIs_admin() {
        return is_admin;
    }

    public ChatDto setIs_admin(String is_admin) {
        this.is_admin = is_admin;
        return this;
    }
}
