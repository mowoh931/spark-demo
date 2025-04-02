package com.baar.sparkdemo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(UserController.class);
    /**
     * This is a simple controller that returns a greeting message.
     *
     * @return A greeting message.
     */
    @GetMapping("/")
    public String home() {
        logger.info("Hello World!");
        return "Hello World, load ....world come to my world!";
    }
}
