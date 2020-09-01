package com.common.code.enums;

/**
 * 网络请求响应信息枚举
 */
public enum ResponseCodeEnum {

    SUCCESS(0, "成功"),
    FAIL(-1, "失败"),
    LOGIN_ERROR(1000, "用户名或密码错误"),
    UNKNOWN_ERROR(2000, "未知错误"),
    PARAMETER_ILLEGAL(2001, "参数不合法"),
    TOKEN_INVALID(2002, "无效的Token"),
    TOKEN_SIGNATURE_INVALID(2003, "无效的签名"),
    TOKEN_EXPIRED(2004, "token已过期"),
    TOKEN_MISSION(2005, "token缺失"),
    REFRESH_TOKEN_INVALID(2006, "刷新Token无效"),
    ACCOUNT_NULL(2007, "账号不存在"),
    ACCOUNT_STOP(2008, "账号已冻结"),
    LOGINNAME_NULL(2009, "登录名为空"),
    PASSWORD_NULL(2100, "密码为空"),
    PASSWORD_Repeat_NULL(2101, "确认密码为空"),
    EMAIL_NULL(2102, "邮箱为空"),
    CODE_NULL(2103, "验证码为空"),
    PASSWORD_PASSWORDRepeat_DIFFERENT(2104, "两次输入密码不一致"),
    LOGINNAME_PRESENCE(2105, "账号已注册"),
    EMAIL_PRESENCE(2106, "邮箱已注册"),
    MOBILE_NULL(2107, "手机号不能为空"),
    MOBILECODE_NULL(2108, "手机验证码不能为空");

    /**
     * 错误代码
     */
    private int code;

    /**
     * 错误信息
     */
    private String message;

    ResponseCodeEnum(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
