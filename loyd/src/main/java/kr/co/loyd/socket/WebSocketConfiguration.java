package kr.co.loyd.socket;

import kr.co.loyd.socket.controller.WebSocketRequestDispatcher;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfiguration implements WebSocketConfigurer {

    private WebSocketRequestDispatcher requestDispatcher;

    private String socketServerUrl = "/endpoint";

    private String origin = "http://localhost:3000";

    public WebSocketConfiguration(WebSocketRequestDispatcher requestDispatcher) {
        this.requestDispatcher = requestDispatcher;
    }

    /**
     * connection 요청에 대해, origin 허용을 하고
     * Socket 통신으로 만들고, 해당 요청을 다시 requestDispatcher 클래스에서 처리합니다.
     * */
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(requestDispatcher, socketServerUrl).setAllowedOrigins(origin).withSockJS();
    }
}
