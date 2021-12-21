package com.greenart.school_management.data;

import java.util.Date;

import lombok.Data;

@Data
public class TeacherHistoryVO {
    private Integer tih_seq;
    private Integer tih_ti_seq;
    private String tih_type;
    private String tih_content;
    private Date tih_reg_dt;
}
