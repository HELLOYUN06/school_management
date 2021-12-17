package com.greenart.school_management.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.greenart.school_management.data.TeacherVO;
import com.greenart.school_management.mapper.TeacherMapper;
import com.greenart.school_management.utils.AESAlgorithm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherService {
    @Autowired TeacherMapper mapper;
    public Map<String, Object> addTeacherInfo(TeacherVO data) throws Exception {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        if(data.getTi_name().equals("") || data.getTi_name() == null){
            resultMap.put("status", false);
            resultMap.put("reason", "name");
            resultMap.put("message", "이름을 입력해주세요.");
            return resultMap;
        }
        if(data.getTi_number().equals("") || data.getTi_number() == null){
            resultMap.put("status", false);
            resultMap.put("reason", "number");
            resultMap.put("message", "교직원 번호를 입력해주세요.");
            return resultMap;
        }
        if(data.getTi_birth().equals("") || data.getTi_birth() == null){
            resultMap.put("status", false);
            resultMap.put("reason", "birth");
            resultMap.put("message", "생년월일을 입력해주세요.");
            return resultMap;
        }
        if(data.getTi_phone_num().equals("") || data.getTi_phone_num() == null){
            resultMap.put("status", false);
            resultMap.put("reason", "phone");
            resultMap.put("message", "전화번호를 입력해주세요.");
            return resultMap;
        }
        if(data.getTi_email().equals("") || data.getTi_email() == null){
            resultMap.put("status", false);
            resultMap.put("reason", "email");
            resultMap.put("message", "이메일을 입력해주세요.");
            return resultMap;
        }

        String pwd = data.getTi_pwd();
        String encrypted = AESAlgorithm.Encrypt(pwd);
        data.setTi_pwd(encrypted);

        mapper.addTeacherInfo(data);

        resultMap.put("status", true);
        resultMap.put("message", "교직원 정보가 추가되었습니다.");
        return resultMap;
    }

    public Map<String, Object> getTeacherList(String type, String keyword, Integer offset){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();

        if(keyword == null) {
            resultMap.put("keyword", keyword);
            keyword = "%%";
        }
        else {
            resultMap.put("keyword", keyword);
            keyword = "%"+keyword+"%";
        }
        resultMap.put("type", type);

        if(offset == null) offset = 0;
        List<TeacherVO> list = mapper.getTeacherList(type, keyword, offset);
        Integer cnt = mapper.getTeacherCnt(type, keyword);
        Integer page = cnt / 10;
        if(cnt % 10 > 0) page++;

        resultMap.put("status", true);
        resultMap.put("pageCnt", page);
        resultMap.put("list", list);

        return resultMap;
    }
    
}
