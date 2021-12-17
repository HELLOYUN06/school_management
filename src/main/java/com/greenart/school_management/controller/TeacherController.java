package com.greenart.school_management.controller;

import com.greenart.school_management.service.TeacherService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TeacherController {
    @Autowired TeacherService service;
    @GetMapping("/teacher")
    public String getTeacherList(Model model, 
        @RequestParam @Nullable String type,
        @RequestParam @Nullable String keyword,
        @RequestParam @Nullable Integer offset
    ){
        model.addAttribute("data", service.getTeacherList(type, keyword, offset));
        return "/teacher/list";
    }
}
