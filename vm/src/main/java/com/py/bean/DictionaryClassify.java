package com.py.bean;

import java.util.Date;

public class DictionaryClassify {
    private Integer dictionaryClassifyId;

    private String dictionaryClassifyName;

    private String dictionaryClassifyNote;

    private Date dictionaryClassifyCreateTime;

    private Date dictionaryClassifyUpdateTime;

    public Integer getDictionaryClassifyId() {
        return dictionaryClassifyId;
    }

    public void setDictionaryClassifyId(Integer dictionaryClassifyId) {
        this.dictionaryClassifyId = dictionaryClassifyId;
    }

    public String getDictionaryClassifyName() {
        return dictionaryClassifyName;
    }

    public void setDictionaryClassifyName(String dictionaryClassifyName) {
        this.dictionaryClassifyName = dictionaryClassifyName == null ? null : dictionaryClassifyName.trim();
    }

    public String getDictionaryClassifyNote() {
        return dictionaryClassifyNote;
    }

    public void setDictionaryClassifyNote(String dictionaryClassifyNote) {
        this.dictionaryClassifyNote = dictionaryClassifyNote == null ? null : dictionaryClassifyNote.trim();
    }

    public Date getDictionaryClassifyCreateTime() {
        return dictionaryClassifyCreateTime;
    }

    public void setDictionaryClassifyCreateTime(Date dictionaryClassifyCreateTime) {
        this.dictionaryClassifyCreateTime = dictionaryClassifyCreateTime;
    }

    public Date getDictionaryClassifyUpdateTime() {
        return dictionaryClassifyUpdateTime;
    }

    public void setDictionaryClassifyUpdateTime(Date dictionaryClassifyUpdateTime) {
        this.dictionaryClassifyUpdateTime = dictionaryClassifyUpdateTime;
    }
}