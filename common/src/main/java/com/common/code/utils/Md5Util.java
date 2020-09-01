package com.common.code.utils;

import lombok.extern.slf4j.Slf4j;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * md5加密
 */
@Slf4j
public class Md5Util {

    private static MessageDigest messageDigest = null;

    static {
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e){
            log.error("初始化失败，MessageDigest不支持MD5Util: ", e);
        }
    }

    private Md5Util(){}

    /**
     * 对字符串进行md5加密
     * @param s 输入字符串
     * @return md5加密结果
     */
    public static String getMD5String(String s){
        return getMD5String(s.getBytes(StandardCharsets.UTF_8));
    }

    public static String getMD5String(byte[] bytes) {
        messageDigest.update(bytes);
        byte[] md = messageDigest.digest();
        StringBuilder sb = new StringBuilder();
        for(byte aMd : md){
            int val = ((int) aMd) & 0xff;
            if (val < 16){
                sb.append("0");
            }
            sb.append(Integer.toHexString(val));
        }
        return sb.toString();
    }
}
