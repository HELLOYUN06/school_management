package com.greenart.school_management.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.greenart.school_management.mapper.DashboardMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardService {
    @Autowired DashboardMapper mapper;
    public Map<String, Object> getCounts(){
        List<Integer> deptCntList = new ArrayList<Integer>();
        deptCntList.add(mapper.getTotalDepartmentCnt());
        deptCntList.add(mapper.getActiveDepartmentCnt());
        deptCntList.add(mapper.getDeactiveDepartmentCnt());

        List<Integer> teacherCntList = new ArrayList<Integer>();
        teacherCntList.add(mapper.getTotalTeacherCnt());
        teacherCntList.add(mapper.getWorkTeacherCnt());
        teacherCntList.add(mapper.getDayOffTeacherCnt());

        List<Integer> stuCntList = new ArrayList<Integer>();
        stuCntList.add(mapper.getTotalStudentCnt());
        stuCntList.add(mapper.getAttendStudentCnt());
        stuCntList.add(mapper.getDayOffStudentCnt());
        stuCntList.add(mapper.getLeaveStudentCnt());

        List<Integer> subjCntList = new ArrayList<Integer>();
        subjCntList.add(mapper.getTotalSubjectcnt());
        subjCntList.add(mapper.getActiveSubjectcnt());
        subjCntList.add(mapper.getDeactiveSubjectcnt());
        subjCntList.add(mapper.getFinishSubjectCnt());

        Map<String, Object> map = new LinkedHashMap<String, Object>();
        map.put("department", deptCntList);
        map.put("teacher", teacherCntList);
        map.put("student", stuCntList);
        map.put("subject", subjCntList);
        return map;
    }
}
