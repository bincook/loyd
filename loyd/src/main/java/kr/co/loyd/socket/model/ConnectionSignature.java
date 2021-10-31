package kr.co.loyd.socket.model;

public class ConnectionSignature {
    private String realTimeServerUrl;
    private String realTimeToken;

    public ConnectionSignature(String realTimeServerUrl, String realTimeToken) {
        this.realTimeServerUrl = realTimeServerUrl;
        this.realTimeToken = realTimeToken;
    }
}
