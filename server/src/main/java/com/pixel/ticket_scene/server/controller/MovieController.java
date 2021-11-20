package com.pixel.ticket_scene.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MovieController {
    @GetMapping("/api")
    public String callApi(@RequestParam("keyword") String keyword ){

    }
}
