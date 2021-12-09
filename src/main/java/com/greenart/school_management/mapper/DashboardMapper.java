package com.greenart.school_management.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DashboardMapper {
    public Integer getTotalDepartmentCnt();
    public Integer getActiveDepartmentCnt();
    public Integer getDeactiveDepartmentCnt();

    public Integer getTotalTeacherCnt();
    public Integer getWorkTeacherCnt();
    public Integer getDayOffTeacherCnt();

    public Integer getTotalStudentCnt();
    public Integer getAttendStudentCnt();
    public Integer getDayOffStudentCnt();
    public Integer getLeaveStudentCnt();

    public Integer getTotalSubjectcnt();
    public Integer getActiveSubjectcnt();
    public Integer getDeactiveSubjectcnt();
    public Integer getFinishSubjectCnt();
}
