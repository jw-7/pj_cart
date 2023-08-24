package com.pj_cart;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@MapperScan(basePackages = {"com.pj_cart.persistence"})
public class PjCartApplication {

    public static void main(String[] args) {
        SpringApplication.run(PjCartApplication.class, args);
    }

}
