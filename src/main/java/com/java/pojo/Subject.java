package com.java.pojo;

/**
 * 课程实体类
 * @author latob
 *
 */
public class Subject {
    private Integer cid;

    private String className;

    private String classImage;

    private Integer status;

    private Long teacherId;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getClassImage() {
        return classImage;
    }

    public void setClassImage(String classImage) {
        this.classImage = classImage == null ? null : classImage.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }
}