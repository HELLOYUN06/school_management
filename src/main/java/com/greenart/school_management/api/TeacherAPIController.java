package com.greenart.school_management.api;

import java.security.Provider.Service;
import java.util.Map;

import com.greenart.school_management.data.TeacherVO;
import com.greenart.school_management.service.TeacherService;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class TeacherAPIController {
    @Autowired TeacherService service;
    @PostMapping("/teacher/add")
    public Map<String, Object> postTeacherAdd(@RequestBody TeacherVO data) throws Exception{
        return service.addTeacherInfo(data);
    }
    @DeleteMapping("/teacher/delete")
    public ResponseEntity<Map<String, Object>> deleteTeacherInfo(@RequestParam Integer seq){
        return service.deleteTeacherInfo(seq);
    }
    @GetMapping("/teacher/get")
    public TeacherVO getTeacherInfoBySeq(@RequestParam Integer seq){
        return service.getTeacherInfoBySeq(seq);
    }
    @PatchMapping("/teacher/modify")
    public Map<String, Object> patchTeacherInfo(@RequestBody TeacherVO data){
        return service.patchTeacherInfo(data);
    }
    
}
