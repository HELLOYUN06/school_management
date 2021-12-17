package com.greenart.school_management.api;

import java.util.Map;

import com.greenart.school_management.data.DepartmentVO;
import com.greenart.school_management.service.DepartmentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DepartmentAPIController {
    @Autowired
    DepartmentService service;
    @PostMapping("/department/add")
    public Map<String, Object> postDepartmentAdd(@RequestBody DepartmentVO data){
        return service.addDepartment(data);
    }
    @DeleteMapping("department/delete")
    public Map<String, Object> deleteDepartment(@RequestParam Integer seq){
        return service.deleteDepartment(seq);
    }
    @GetMapping("/department/get")
    public Map<String, Object> getDepartmentInfoBySeq(@RequestParam Integer seq){
        return service.getDepartmentInfoBySeq(seq);
    }
    @PatchMapping("/department/update")
    public Map<String, Object> patchDepartmentInfo(@RequestBody DepartmentVO data){
        return service.updateDepartmentInfo(data);
    }
    @GetMapping("department/keyword")
    public Map<String, Object> getDepartmentByKeyword(@RequestParam @Nullable String keyword){
        return service.getDepartmentByKeyword(keyword);
    }
}
