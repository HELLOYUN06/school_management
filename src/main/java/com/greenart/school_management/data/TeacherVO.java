package com.greenart.school_management.data;

import java.sql.Date;

import lombok.Data;
@Data
public class TeacherVO {
    private Integer ti_seq;
    private Integer ti_di_seq;
    private String ti_number;
    private String ti_name;
    private String ti_birth;
    private String ti_pwd;
    private Date ti_reg_dt;
    private Date ti_mod_dt;
    private String ti_phone_num;
    private String ti_email;
    private Integer ti_status;
    private String department_name;
}
