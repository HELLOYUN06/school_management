package com.greenart.school_management.controller;

import java.util.Map;

import com.greenart.school_management.service.DepartmentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService service;
    @GetMapping("/department")
    public String getDepartment(
        Model model, @RequestParam @Nullable Integer offset,
        @RequestParam @Nullable String keyword
    ){
        Map<String, Object> resultMap = service.getDepartmentList(offset, keyword);
        model.addAttribute("data", resultMap);
        return "/department/list";
    }
}
