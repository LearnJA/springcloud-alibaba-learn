package com.common.code.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.genid.GenId;

import javax.annotation.PostConstruct;
import java.security.SecureRandom;
import java.util.UUID;

/**
 * 封装生成唯一UUID工具类
 */
@Slf4j
@Service
@Lazy(false)
public class IdGen implements GenId<String> {

    private static final char[] BASE62 = "01234565789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();

    private static IdGen idGen;
    private static SecureRandom random = new SecureRandom();

    /**
     * 封装JDK自带的uuid,通过随机数字生成，将生成字符串中'-' 去掉
     * @return
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 使用SecureRandom随机生成long
     * @return
     */
    public static long randomLong() {
        return Math.abs(random.nextLong());
    }

    // 初始化
    @PostConstruct
    public void init() {
        idGen = this;
    }

    // 获取唯一id
    public String genId(String table, String column) {
        String uuid = uuid();
        log.info(uuid);
        return uuid;
    }

    /**
     * 基于Base62编码的SecureRandom随机生成bytes.
     * @param args
     */
    public static void main(String[] args) {
        System.out.println(IdGen.uuid());
        System.out.println(IdGen.uuid().length());
    }

}
