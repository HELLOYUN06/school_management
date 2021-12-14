package com.greenart.school_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TeacherController {
    @GetMapping("/teacher")
    public String getTeacherList(){
        return "/teacher/list";
    }
}
