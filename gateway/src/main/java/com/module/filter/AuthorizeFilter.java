package com.module.filter;

import com.alibaba.fastjson.JSON;
import com.common.code.enums.ResponseCodeEnum;
import com.common.code.exception.TokenAuthenticationException;
import com.common.code.result.ResponseResult;
import com.common.code.utils.JWTUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * 权限认证拦截器
 */
@Slf4j
@Component
@RefreshScope
public class AuthorizeFilter implements GlobalFilter, Ordered {

    // gateway配置secretKey
    @Value("${secretKey:123456}")
    private String secretKey;

    // 网关配置白名单
    @Value("${white.name}")
    private String[] whileName;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //获取http请求
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
        //获取请求路径 用于验证白名单
        String path = request.getURI().getPath();
        log.info("请求路径为：" + path);
        // 检查白名单 （网关配置白名单 放行）
        for (int i = 0; i < whileName.length; i++) {
            log.info("白名单" + whileName[i]);
            //判断是否存在于白名单中
            if (path.indexOf(whileName[i]) > 0) {
                //存在  直接放行
                return chain.filter(exchange);
            }
        }
        //获取请求头中的token
        HttpHeaders headers = request.getHeaders();
        String token = headers.getFirst("token");
        //判断token是否存在
        if (StringUtils.isBlank(token)) {
            //不存在直接返回提示
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            return getVoidMono(response, ResponseCodeEnum.TOKEN_MISSION);
        }
        // todo 效验token是否存在redis中
        try {
            JWTUtil.verifyToken(token, secretKey);
        } catch (TokenAuthenticationException ex) {
            return getVoidMono(response, ResponseCodeEnum.TOKEN_INVALID);
        } catch (Exception ex) {
            return getVoidMono(response, ResponseCodeEnum.UNKNOWN_ERROR);
        }
        return null;
    }

    /**
     * 设置响应信息
     * @param response
     * @param responseCodeEnum
     * @return
     */
    private Mono<Void> getVoidMono(ServerHttpResponse response, ResponseCodeEnum responseCodeEnum){
        //设置响应请求头
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        //创建返回信息
        ResponseResult<?> result = ResponseResult.error(responseCodeEnum.getCode(), responseCodeEnum.getMessage());
        DataBuffer dataBuffer = response.bufferFactory().wrap(JSON.toJSONString(result).getBytes());
        return response.writeWith(Flux.just(dataBuffer));
    }

    @Override
    public int getOrder() {
        log.info("执行了getOrder()方法 .......");
        return -100;
    }
}
