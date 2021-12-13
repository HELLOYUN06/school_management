package com.greenart.school_management.data;

import java.util.Date;

import lombok.Data;
@Data
public class DepartmentVO {
    private Integer di_seq;
    private String di_name;
    private Integer di_graduate_score;
    private Date di_reg_dt;
    private Date di_mod_dt;
    private Integer di_status;

}
