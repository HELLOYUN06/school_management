package com.greenart.school_management.mapper;

import java.util.List;

import com.greenart.school_management.data.DepartmentHistoryVO;
import com.greenart.school_management.data.DepartmentVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DepartmentMapper {
    public List<DepartmentVO> getDepartmentInfo(Integer offset, String keyword);
    public Integer getDepartmentCount(String keyword);
    public void addDepartment(DepartmentVO data);
    public void deleteDepartment(Integer seq);
    public DepartmentVO getDepartmentInfoBySeq(Integer seq);
    public void updateDepartment(DepartmentVO data);
    public Integer selectLatestDataSeq();

    public void insertDepartmentHistory(DepartmentHistoryVO data);
}
