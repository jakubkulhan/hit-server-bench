package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/")
public class ExampleController {

    @Autowired
    ScheduledExecutorService scheduler;

    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        return Long.toString(System.currentTimeMillis());
    }

    @RequestMapping(method = RequestMethod.GET, path = "/async")
    public CompletableFuture<String> indexAsync() {
        final CompletableFuture<String> f = new CompletableFuture<>();

        scheduler.schedule(() -> {
            f.complete(Long.toString(System.currentTimeMillis()));
        }, 200, TimeUnit.MILLISECONDS);

        return f;
    }

}
