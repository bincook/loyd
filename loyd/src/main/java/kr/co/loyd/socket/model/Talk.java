package kr.co.loyd.socket.model;

import java.time.LocalDateTime;

public class Talk {
    private Integer talkId;
    private String ip;
    private String content;
    private LocalDateTime createdAt;

    public Integer getTalkId() {
        return talkId;
    }

    public Talk setTalkId(Integer talkId) {
        this.talkId = talkId;
        return this;
    }

    public String getIp() {
        return ip;
    }

    public Talk setIp(String ip) {
        this.ip = ip;
        return this;
    }

    public String getContent() {
        return content;
    }

    public Talk setContent(String content) {
        this.content = content;
        return this;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public Talk setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
        return this;
    }
}
