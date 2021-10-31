package kr.co.loyd.socket.controller;

import kr.co.loyd.socket.util.TokenManager;
import kr.co.loyd.socket.message.Error;
import kr.co.loyd.socket.model.ConnectionSignature;
import kr.co.loyd.socket.model.IpAddress;
import kr.co.loyd.socket.util.IpAddressValidator;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 소켓 통신 연결에 사용할
 * 토큰과 url을 발급합니다.
 * */
@Controller
@RequestMapping(value = "/socket")
public class SocketConnectionController {
    private String realTimeServerUrl = "/endpoint";
    private final TokenManager tokenManager;
    private final IpAddressValidator ipAddressValidator;

    public SocketConnectionController(TokenManager tokenManager, IpAddressValidator ipAddressValidator) {
        this.tokenManager = tokenManager;
        this.ipAddressValidator = ipAddressValidator;
    }

    @RequestMapping(value = "/connect/url")
    public ResponseEntity getConnectionUrl(@RequestParam(value = "ip") String ipAddress) {
        // ip 주소가 유효하지 않은 경우 예외
        if (!ipAddressValidator.isValidInet4Address(ipAddress))
            throw new IllegalArgumentException(Error.invalidIpAddress.parseMessage(ipAddress));

        String realTimeAuthenticationToken = tokenManager.createJsonWebToken(new IpAddress(ipAddress));
        return new ResponseEntity(
                new ConnectionSignature(realTimeServerUrl, realTimeAuthenticationToken)
                , null
                , HttpStatus.OK
        );
    }
}
