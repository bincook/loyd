package kr.co.loyd.socket.model;


public class IpAddress {
    private String ipV4;

    public IpAddress(String ipV4) {
        this.ipV4 = ipV4;
    }

    public String getIpV4() {
        return ipV4;
    }

    public IpAddress setIpV4(String ipV4) {
        this.ipV4 = ipV4;
        return this;
    }
}
