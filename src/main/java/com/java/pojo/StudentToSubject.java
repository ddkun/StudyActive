package com.java.pojo;

/**
 * 学生选课实体类
 * @author latob
 *
 */
public class StudentToSubject {
    private Integer scid;

    private Long studentid;

    private Integer classid;

    public Integer getScid() {
        return scid;
    }

    public void setScid(Integer scid) {
        this.scid = scid;
    }

    public Long getStudentid() {
        return studentid;
    }

    public void setStudentid(Long studentid) {
        this.studentid = studentid;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }
}