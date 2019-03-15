package com.py.bean;

public class OrderMessage {
    private Integer orderMessageId;

    private String content;

    private String createTime;

    public Integer getOrderMessageId() {
        return orderMessageId;
    }

    public void setOrderMessageId(Integer orderMessageId) {
        this.orderMessageId = orderMessageId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }
}