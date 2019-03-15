package com.py.dao;

import java.util.List;

import com.py.bean.Message;
import com.py.bean.UserMessage;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer messageId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer messageId);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

	List<Message> selectByExample(Message message);

	Message selectByPrimary(Message message);

	List<UserMessage> selectAllMessageAndUser();

	int deleteByPrimary(Message message);
}