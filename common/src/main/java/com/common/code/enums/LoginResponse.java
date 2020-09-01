package com.common.code.enums;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户登录响应
 */
@Data
public class LoginResponse implements Serializable {

    private String token;

    private String refreshToken;

    private String userId;

    private String nickName;
}
