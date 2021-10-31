package kr.co.loyd.socket.message;

public enum Error {
    invalidIpAddress("요청하신 ip 주소 %s 가 유효하지 않습니다.");

    private String message;

    Error(String message) {
        this.message = message;
    }

    public String parseMessage(String ...keyword) {
        return String.format(message, keyword);
    }

}
