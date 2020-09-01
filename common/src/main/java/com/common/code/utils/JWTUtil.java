package com.common.code.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.SignatureVerificationException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.common.code.enums.ResponseCodeEnum;
import com.common.code.exception.TokenAuthenticationException;

import javax.xml.crypto.Data;
import java.util.Date;

/**
 * jwt工具类
 */
public class JWTUtil {

    // 设置token有效时长
    public static final long TOKEN_EXPIRE_TIME = 7200 * 1000;
    private static final String ISSUER = "cheng";

    /**
     * 生成Token
     *
     * @param userName 用户标识 (不一定是用户名，有可能是用户id或者手机号什么的)
     * @param secretKey
     * @return
     */
    public static String generateToken(String userName, String secretKey) {
        //使用算法加密
        Algorithm algorithm = Algorithm.HMAC256(secretKey);
        Date now = new Date();
        //计算过期时间
        Date expireTime = new Date(now.getTime() + TOKEN_EXPIRE_TIME);

        //生成token
        String token = JWT.create().withIssuer(ISSUER)
                                    .withIssuedAt(now)
                                    .withExpiresAt(expireTime)
                                    .withClaim("userName", userName)
                                    .sign(algorithm);
        return token;
    }

    /**
     * 效验Token
     * @param token
     * @param secretKey
     */
    public static void verifyToken(String token, String secretKey) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(secretKey);
            JWTVerifier jwtVerifier = JWT.require(algorithm).withIssuer(ISSUER).build();
            jwtVerifier.verify(token);
        } catch (JWTDecodeException jwtDecodeExceotion) {
            throw new TokenAuthenticationException(
                    ResponseCodeEnum.TOKEN_INVALID.getCode(),
                    ResponseCodeEnum.TOKEN_INVALID.getMessage()
            );
        } catch (SignatureVerificationException signatureVerificationException) {
            throw new TokenAuthenticationException(
                    ResponseCodeEnum.TOKEN_SIGNATURE_INVALID.getCode(),
                    ResponseCodeEnum.TOKEN_SIGNATURE_INVALID.getMessage());
        } catch (TokenExpiredException tokenExpiredException) {
            throw new TokenAuthenticationException(
                    ResponseCodeEnum.TOKEN_EXPIRED.getCode(), ResponseCodeEnum.TOKEN_INVALID.getMessage());
        } catch (Exception ex) {
            throw new TokenAuthenticationException(
                    ResponseCodeEnum.UNKNOWN_ERROR.getCode(), ResponseCodeEnum.UNKNOWN_ERROR.getMessage());
        }
    }

    /**
     * 从Token中提取用户信息
     * @param token
     * @return
     */
    public static String getUserInfo(String token) {
        DecodedJWT decodedJWT = JWT.decode(token);
        String userName = decodedJWT.getClaim("userName").asString();
        return userName;
    }
}
