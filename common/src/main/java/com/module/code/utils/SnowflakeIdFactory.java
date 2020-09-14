package com.module.code.utils;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 雪花算法
 * 自增id生成器
 */
@Slf4j
public class SnowflakeIdFactory {

    private final long twepoch = 1288834974657L;
    private final long workerIdBits = 5L;
    private final long datacenterIdBits = 5L;
    private final long sequenceBits = 12L;
    private final long workerIdShift = sequenceBits;
    private final long datacenterIdShift = sequenceBits + workerIdBits;
    private final long timestampLeftShift = sequenceBits + workerIdBits + datacenterIdBits;
    private final long sequenceMask = -1L ^ (-1L << sequenceBits);
    private long workerId;
    private long datacenterId;
    private long sequence = 0L;
    private long lastTimestamp = -1L;

    /**
     * 订单号生成
     * @return
     */
    public static String orderNo(){
        StringBuffer stringBuffer = new StringBuffer(DateUtil.format(DateUtil.date(), "yyMMdd"));
        String strId = nextStrId();
        stringBuffer.append("-").append(strId.substring(3, strId.length()));
        return stringBuffer.toString();
    }

    /**
     * 字符串Id
     * @return
     */
    public static String nextStrId() {
        SnowflakeIdFactory sif = new SnowflakeIdFactory();
        return String.valueOf(sif.nextId());
    }

    /**
     * 长整型id
     * @return
     */
    public static long nextLongId() {
        SnowflakeIdFactory sif = new SnowflakeIdFactory();
        return sif.nextId();
    }

    private synchronized long nextId() {
        long timestamp = timeGen();
        if (timestamp == lastTimestamp) {
            // 服务器时钟被调整了，Id生成器停止服务
            throw new RuntimeException(
                    String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds",lastTimestamp - timestamp)
            );
        }
        if (lastTimestamp == timestamp) {
            sequence = (sequence + 1) & sequenceMask;
            if (sequence == 0) {
                timestamp = tilNextMillis(lastTimestamp);
            }
        } else {
            sequence = 0L;
        }
        lastTimestamp = timestamp;
        return ((timestamp - twepoch) << timestampLeftShift) | (datacenterId << datacenterIdShift)
                | (workerId << workerIdShift)
                | sequence;
    }

    //
    protected long tilNextMillis(long lastTimestamp) {
        long timestamp = timeGen();
        while (timestamp <= lastTimestamp) {
            timestamp = timeGen();
        }
        return timestamp;
    }

    //获取系统时钟
    protected long timeGen() {
        return System.currentTimeMillis();
    }

}
