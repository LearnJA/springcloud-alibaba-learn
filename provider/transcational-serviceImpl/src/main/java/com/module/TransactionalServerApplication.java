package com.module;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 分布式事务层
 */
@EnableDiscoveryClient
@SpringBootApplication
public class TransactionalServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(TransactionalServerApplication.class, args);
    }
}
