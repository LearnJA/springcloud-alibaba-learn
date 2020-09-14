package com.module.code.exception;

/**
 * token权限验证错误
 */
public class TokenAuthenticationException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public TokenAuthenticationException (int code, String message) {
        super(message + ", 错误代码： " + code);
    }

}
