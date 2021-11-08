package kr.co.loyd.socket.util;

/**
 * 아이디를 통해서 토큰을 발급하고,
 * 해당 토큰에서 아이디를 추출해줍니다.
 * */
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import kr.co.loyd.socket.model.IpAddress;
import org.springframework.stereotype.Component;
import sun.net.util.IPAddressUtil;
import sun.security.x509.IPAddressName;

import java.security.Key;
@Component
public class TokenManager {

    private Key secretKey;

    public TokenManager() {
        this.secretKey = Keys.hmacShaKeyFor(Decoders.BASE64.decode("60dKuW2Qpc3YkUoaa9i6qY5cyaGgQM8clfxpDGWS3sY="));
    }

    /**
     * Generate a JWT with user's id as its subject
     *
     * @param ipAddress the id of the user
     * @return a JWT value
     */
    public String createJsonWebToken(IpAddress ipAddress) {
        return Jwts.builder()
                .setSubject(ipAddress.getIpV4())
                .signWith(secretKey).compact();
    }

    /**
     * Get user id out of a JWT value
     *
     * @param jws the jwt string
     * @return user id
     */
    public IpAddress verifyJsonWebToken(String jws) {
        String userIdValue = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(jws).getBody().getSubject();
        return new IpAddress(userIdValue);
    }
}
