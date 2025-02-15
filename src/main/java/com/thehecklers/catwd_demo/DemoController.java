package com.thehecklers.catwd_demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    @GetMapping
    public String getContainerAppUp() {
        return "Container app up!";
    }

    @GetMapping("/java")
    public String getJavaMessage() {
        return "Brewing fresh Java inside this container. ☕️";
    }
}
