package com.common.code.result;

import com.common.code.enums.ResponseCodeEnum;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable {

    private int code = 0;

    private String msg;

    private T data;

    public ResponseResult(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public ResponseResult(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static ResponseResult<?> success() {
        return new ResponseResult<Object>(
                ResponseCodeEnum.SUCCESS.getCode(), ResponseCodeEnum.SUCCESS.getMessage());
    }

    public static <T> ResponseResult<T> success(T data) {
        return new ResponseResult<T>(
                ResponseCodeEnum.SUCCESS.getCode(), ResponseCodeEnum.SUCCESS.getMessage(), data);
    }

    public static ResponseResult<?> error() {
        return new ResponseResult<Object>(
                ResponseCodeEnum.FAIL.getCode(), ResponseCodeEnum.FAIL.getMessage());
    }

    public static ResponseResult<?> error(String msg) {
        return new ResponseResult<Object>(ResponseCodeEnum.FAIL.getCode(), msg);
    }

    public static ResponseResult<?> error(int code, String msg) {
        return new ResponseResult<Object>(code, msg);
    }

    public static <T> ResponseResult<T> error(int code, String msg, T data) {
        return new ResponseResult<T>(code, msg, data);
    }

    public boolean isSuccess() {
        return code == 0;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
