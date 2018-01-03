package com.java.pojo;

import java.util.Date;

public class Discuss {
    private Integer did;

    private String discussTitle;

    private Long publishId;

    private Date publishDaate;

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public String getDiscussTitle() {
        return discussTitle;
    }

    public void setDiscussTitle(String discussTitle) {
        this.discussTitle = discussTitle == null ? null : discussTitle.trim();
    }

    public Long getPublishId() {
        return publishId;
    }

    public void setPublishId(Long publishId) {
        this.publishId = publishId;
    }

    public Date getPublishDaate() {
        return publishDaate;
    }

    public void setPublishDaate(Date publishDaate) {
        this.publishDaate = publishDaate;
    }
}