package com.common.code.utils;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.json.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.SortParameters;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.query.SortQueryBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Redis工具类， 使用前确保RedisTemplate成功注入
 */
@Slf4j
@Component
public class RedisUtils {

    @Resource
    private RedisTemplate<String, Object> redisTemplate;

    private RedisUtils() {}

    /**
     * 判断key是否存在
     * @param key
     * @return
     */
    public boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }

    /**
     * 设置有效时间
     * @param key Redis键
     * @param timeout  超时时间
     * @return  true 设置成功， false 设置失败
     */
    public boolean expire(final String key, final long timeout) {
        return expire(key, timeout, TimeUnit.SECONDS);
    }

    /**
     * 设置有效时间
     * @param key Redis键
     * @param timeout 超时时间
     * @param unit 时间单位
     * @return true 设置成功;false 设置失败
     */
    public boolean expire(final String key, final long timeout, final TimeUnit unit){
        Boolean ret = redisTemplate.expire(key, timeout, unit);
        return ret != null && ret;
    }

    /**
     * 删除单个key
     * @param key 键
     * @return true 删除成功； false 删除成功
     */
    public boolean del(final String key) {
        Boolean ret = redisTemplate.delete(key);
        return ret != null && ret;
    }

    /**
     * 删除多个key
     * @param keys 键集合
     * @return 成功删除的个数
     */
    public long del(final Collection<String> keys) {
        Long ret = redisTemplate.delete(keys);
        return ret == null ? 0 : ret;
    }

    /**
     * 存入普遍对象
     * @param key Redis
     * @param value 值
     */
    public void set(final String key, final Object value) {
        redisTemplate.opsForValue().set(key, value, 1, TimeUnit.MINUTES);
    }

    // 存储普遍对象操作

    /**
     * 存入普通对象
     * @param key 键
     * @param value 值
     * @param timeout 有效期， 单位秒
     */
    public void set(final String key, final Object value, final long timeout) {
        redisTemplate.opsForValue().set(key, value, timeout, TimeUnit.SECONDS);
    }

    /**
     * 获取普通对象
     * @param key 键
     * @return 对象
     */
    public Object get(final String key) {
        return redisTemplate.opsForValue().get(key);
    }

    //存储Hash操作

    /**
     * 往Hash中存入数据
     * @param key Redis键
     * @param hKey Hash键
     * @param value 值
     */
    public void hPut(final  String key, final String hKey, final Object value) {
        redisTemplate.opsForHash().put(key, hKey, value);
    }

    /**
     * 往Hash中存入多个数据
     *
     * @param key    Redis键
     * @param values Hash键值对
     */
    public void hPutAll(final String key, final Map<String, Object> values) {
        redisTemplate.opsForHash().putAll(key, values);
    }

    /**
     * 获取Hash中的数据
     *
     * @param key  Redis键
     * @param hKey Hash键
     * @return Hash中的对象
     */
    public Object hGet(final String key, final String hKey) {
        return redisTemplate.opsForHash().get(key, hKey);
    }

    /**
     * 获取多个Hash中的数据
     *
     * @param key   Redis键
     * @param hKeys Hash键集合
     * @return Hash对象集合
     */
    public List<Object> hMultiGet(final String key, final Collection<Object> hKeys) {
        return redisTemplate.opsForHash().multiGet(key, hKeys);
    }

    // 存储Set相关操作

    /**
     * 往Set中存入数据
     *
     * @param key    Redis键
     * @param values 值
     * @return 存入的个数
     */
    public long sSet(final String key, final Object... values) {
        Long count = redisTemplate.opsForSet().add(key, values);
        return count == null ? 0 : count;
    }

    /**
     * 删除Set中的数据
     *
     * @param key    Redis键
     * @param values 值
     * @return 移除的个数
     */
    public long sDel(final String key, final Object... values) {
        Long count = redisTemplate.opsForSet().remove(key, values);
        return count == null ? 0 : count;
    }

    // 存储List相关操作

    /**
     * 往List中存入数据
     *
     * @param key   Redis键
     * @param value 数据
     * @return 存入的个数
     */
    public long lPush(final String key, final Object value) {
        Long count = redisTemplate.opsForList().rightPush(key, value);
        return count == null ? 0 : count;
    }

    /**
     * 往List中存入多个数据
     *
     * @param key    Redis键
     * @param values 多个数据
     * @return 存入的个数
     */
    public <T> long lPushAll(final String key, final Collection<T> values) {
        if (CollectionUtil.isEmpty(values)) {
            return 0;
        }
        Long count = 0L;
        for (T o : values) {
            try {
                count += lPush(key, o);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
        return count == null ? 0 : count;
    }

    /**
     * 往List中存入多个数据
     *
     * @param key    Redis键
     * @param values 多个数据
     * @return 存入的个数
     */
    public <T> long lPushAll(final String key, final T... values) {
        if (values == null || values.length == 0) {
            return 0;
        }
        Long count = 0L;
        for (T o : values) {
            try {
                count += lPush(key, o);
            } catch (Exception e) {
                log.error(e.getMessage(), e);
            }
        }
        return count == null ? 0 : count;
    }

    /**
     * 从List中获取begin到end之间的元素
     *
     * @param key   Redis键
     * @param start 开始位置
     * @param end   结束位置（start=0，end=-1表示获取全部元素）
     * @return List对象
     */
    public List<Object> lGet(final String key, final long start, final long end) {
        List<Object> resultList = Lists.newArrayList();
        List<Object> objectList = redisTemplate.opsForList().range(key, start, end);
        if (CollectionUtil.isEmpty(objectList)) {
            return resultList;
        }
        for (Object o : objectList) {
            if (o instanceof JSONArray) {
                JSONArray jsonArray = (JSONArray) o;
                for (Object j : jsonArray) {
                    JSONObject jsonObject = (JSONObject) j;
                    resultList.add(jsonObject.toJavaObject(Object.class));
                }
            }
            if (o instanceof JSONObject) {
                JSONObject jsonObject = (JSONObject) o;
                resultList.add(jsonObject.toJavaObject(Object.class));
            }
        }
        return resultList;
    }

    /**
     * 从List中获取begin到end之间的元素
     *
     * @param key   Redis键
     * @param start 开始位置
     * @param end   结束位置（start=0，end=-1表示获取全部元素）
     * @param clazz 集合所存放的对象
     * @return List对象
     */
    public <T> List<T> lGet(final String key, final long start, final long end, Class<T> clazz) {
        List<T> resultList = Lists.newArrayList();
        List<Object> objectList = redisTemplate.opsForList().range(key, start, end);
        if (CollectionUtil.isEmpty(objectList)) {
            return resultList;
        }
        for (Object o : objectList) {
            if (o instanceof JSONArray) {
                JSONArray jsonArray = (JSONArray) o;
                for (Object j : jsonArray) {
                    JSONObject jsonObject = (JSONObject) j;
                    resultList.add(jsonObject.toJavaObject(clazz));
                }
            }
            if (o instanceof JSONObject) {
                JSONObject jsonObject = (JSONObject) o;
                resultList.add(jsonObject.toJavaObject(clazz));
            }
        }
        return resultList;
    }

    /**
     * 获取集合的长度
     *
     * @param key Redis键
     * @return
     */
    public long size(final String key) {
        return redisTemplate.opsForList().size(key);
    }

    public <T> List<T> sortPageList(
            String key, String subKey, String by, boolean isDesc, boolean isAlpha, int off, int num)
            throws Exception {
        SortQueryBuilder<String> builder = SortQueryBuilder.sort(key);
        builder.by(subKey + "*->" + by);
        builder.get("#");
        builder.alphabetical(isAlpha);
        if (isDesc) {
            builder.order(SortParameters.Order.DESC);
        }
        builder.limit(off, num);
        List<Object> cks = redisTemplate.sort(builder.build());
        List<T> result = Lists.newArrayList();
        for (Object ck : cks) {
            // 得到项目对象 by(subKey+ck);
        }
        return result;
    }
}
