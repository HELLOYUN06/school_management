package com.greenart.school_management.controller;

import java.util.Map;

import com.greenart.school_management.service.DepartmentService;
import com.greenart.school_management.utils.AESAlgorithm;

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
    )throws Exception{
        Map<String, Object> resultMap = service.getDepartmentList(offset, keyword);
        model.addAttribute("data", resultMap);
        // ReBaRzwJEjjjhswTTFlP7A== (검색어에 '컴퓨터' 입력결과)
        if(keyword != null)
            System.out.println(AESAlgorithm.Encrypt(keyword));

        return "/department/list";
    }
}
