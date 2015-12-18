package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;

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
    public DeferredResult<String> indexAsync() {
        DeferredResult<String> result = new DeferredResult<>();

        scheduler.schedule(() -> {
            result.setResult(Long.toString(System.currentTimeMillis()));
        }, 200, TimeUnit.MILLISECONDS);

        return result;
    }

}
