package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/**
 * @author Jakub Kulhan <jakub.kulhan@gmail.com>
 */
@SpringBootApplication
@EnableScheduling
@EnableAsync
public class SpringBootMain {

    @Bean
    ScheduledExecutorService scheduledExecutorService() {
        ScheduledThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(50);
        return executor;
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringBootMain.class, args);
    }

}
