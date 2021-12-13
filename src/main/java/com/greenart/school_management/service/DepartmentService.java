package com.greenart.school_management.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.greenart.school_management.data.DepartmentVO;
import com.greenart.school_management.mapper.DepartmentMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentService {
    @Autowired 
    DepartmentMapper mapper;

    public Map<String, Object> getDepartmentList(Integer offset){
        if(offset == null) offset = 0;

        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        List<DepartmentVO> list = mapper.getDepartmentInfo(offset);

        Integer cnt = mapper.getDepartmentCount();
        Integer page_cnt = cnt / 10;
        if(cnt % 10 > 0) page_cnt++;

        // Integer page_cnt = cnt / 10 +(cnt%10>0?1:0);

        resultMap.put("status", true);
        resultMap.put("total", cnt);
        resultMap.put("pageCnt", page_cnt);
        resultMap.put("list", list);
        return resultMap;
    }
    public Map<String, Object> addDepartment(DepartmentVO data){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        if(data.getDi_name() == null || data.getDi_name().equals("")){
            resultMap.put("status", false);
            resultMap.put("message", "학과명을 입력하세요.");
            return resultMap;
        }
        if(data.getDi_graduate_score() == null || data.getDi_graduate_score() == 0){
            resultMap.put("status", false);
            resultMap.put("message", "졸업학점을 입력하세요.");
            return resultMap;
        }
        
        mapper.addDepartment(data);
        resultMap.put("status", true);
        resultMap.put("message", "학과가 추가되었습니다.");
        return resultMap;
    }
    public Map<String, Object> deleteDepartment(Integer seq){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        mapper.deleteDepartment(seq);
        resultMap.put("status", true);
        resultMap.put("message", "학과가 삭제되었습니다.");
        return resultMap;
    }
}
