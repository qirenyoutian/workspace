package com.py.dao;

import java.util.List;

import com.py.bean.PushMessage;

public interface PushMessageMapper {
    int deleteByPrimaryKey(Integer pushMessageId);

    int insert(PushMessage record);

    int insertSelective(PushMessage record);

    PushMessage selectByPrimaryKey(Integer pushMessageId);

    int updateByPrimaryKeySelective(PushMessage record);

    int updateByPrimaryKey(PushMessage record);

	List<PushMessage> selectByExample(PushMessage pushMessage);

	PushMessage selectByPrimary(PushMessage pushMessage);
}