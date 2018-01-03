package com.java.pojo;

import java.util.Date;
/**
 * 通知实体类
 * @author latob
 *
 */
public class Notice {
    private Integer nid;

    private String noticeDesc;

    private String noticeContent;

    private Date addDate;

    private Integer status;

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public String getNoticeDesc() {
        return noticeDesc;
    }

    public void setNoticeDesc(String noticeDesc) {
        this.noticeDesc = noticeDesc;
    }

    public String getNoticeContent() {
        return noticeContent;
    }

    public void setNoticeContent(String noticeContent) {
        this.noticeContent = noticeContent;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}