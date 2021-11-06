package kr.co.loyd.socket.message;

public enum Error {
    invalidIpAddress("요청하신 ip 주소 %s 가 유효하지 않습니다.")
    , thereAreNoChannel("요청한 채널이 없습니다. 먼저 구독을 진행해주세요.")
    , invalidParameter("입렵 값이 유효하지 않습니다. $s");

    private String message;

    Error(String message) {
        this.message = message;
    }

    public String parseMessage(String ...keyword) {
        return String.format(message, keyword);
    }

}
