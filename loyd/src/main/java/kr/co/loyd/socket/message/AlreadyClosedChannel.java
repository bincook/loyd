package kr.co.loyd.socket.message;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.CONFLICT)
public class AlreadyClosedChannel extends RuntimeException {
    public AlreadyClosedChannel(String message) {
        super(message);
    }
}
