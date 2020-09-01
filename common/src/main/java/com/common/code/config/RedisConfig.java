package com.common.code.config;

import com.alibaba.fastjson.support.spring.FastJsonRedisSerializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * redis缓存配置
 */
@Configuration
public class RedisConfig {

    /**
     * 配置数据存储序列化方式
     * @param connectionFactory
     * @return
     */
    @Bean
    public RedisTemplate<Object, Object> redisTemplate(RedisConnectionFactory connectionFactory){
        // 注：RedisTemplate默认使用JDK提供的JdkSerializationRedisSerializer 但序列化结果庞大浪费存储磁盘
        RedisTemplate<Object, Object> template = new RedisTemplate<>();
        // fastJson序列化
        FastJsonRedisSerializer fastJsonRedisSerializer = new FastJsonRedisSerializer<Object>(Object.class);
        // value值序列化采用fastJsonRedisSerializer
        template.setValueSerializer(fastJsonRedisSerializer);
        // key使用StringRedisSerializer序列化
        template.setKeySerializer(new StringRedisSerializer());
        template.setHashKeySerializer(new StringRedisSerializer());
        template.setHashValueSerializer(fastJsonRedisSerializer);
        template.setConnectionFactory(connectionFactory);
        return template;
    }

    /**
     * 获取redis连接工厂
     * @param redisConnectionFactory
     * @return
     */
    @Bean
    public StringRedisTemplate stringRedisTemplate(RedisConnectionFactory redisConnectionFactory) {
        StringRedisTemplate template = new StringRedisTemplate();
        template.setConnectionFactory(redisConnectionFactory);
        return template;
    }

}
