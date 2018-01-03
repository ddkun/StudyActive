package com.java.pojo;
/**
 * 课程详情实体类
 * @author latob
 *
 */
public class ClassInfo {
    private Integer ciid;

    private String classinfoTitle;

    private Integer classid;

    private Integer status;

    public Integer getCiid() {
        return ciid;
    }

    public void setCiid(Integer ciid) {
        this.ciid = ciid;
    }

    public String getClassinfoTitle() {
        return classinfoTitle;
    }

    public void setClassinfoTitle(String classinfoTitle) {
        this.classinfoTitle = classinfoTitle == null ? null : classinfoTitle.trim();
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}