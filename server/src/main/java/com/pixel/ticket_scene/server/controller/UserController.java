package com.pixel.ticket_scene.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @GetMapping("/")
    public void viewProfile() {

    }

    @PostMapping(@RequestBody())
    public void editProfile() {

    }

}
