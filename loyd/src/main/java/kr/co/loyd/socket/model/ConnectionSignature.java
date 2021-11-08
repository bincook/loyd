package kr.co.loyd.socket.model;

public class ConnectionSignature {
    private String realTimeServerUrl;
    private String realTimeToken;

    public ConnectionSignature(String realTimeServerUrl, String realTimeToken) {
        this.realTimeServerUrl = realTimeServerUrl;
        this.realTimeToken = realTimeToken;
    }

    public String getRealTimeServerUrl() {
        return realTimeServerUrl;
    }

    public ConnectionSignature setRealTimeServerUrl(String realTimeServerUrl) {
        this.realTimeServerUrl = realTimeServerUrl;
        return this;
    }

    public String getRealTimeToken() {
        return realTimeToken;
    }

    public ConnectionSignature setRealTimeToken(String realTimeToken) {
        this.realTimeToken = realTimeToken;
        return this;
    }
}
