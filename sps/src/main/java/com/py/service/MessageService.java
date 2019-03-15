package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Message;
import com.py.bean.UserMessage;
import com.py.dao.MessageMapper;

@Service
public class MessageService {

	@Autowired
	MessageMapper messageMapper;
	
	public int deleteByPrimaryKey(Integer messageId) {
		return messageMapper.deleteByPrimaryKey(messageId);
	}

	public int insert(Message record) {
		return messageMapper.insert(record);
	}

	public int insertSelective(Message record) {
		return messageMapper.insertSelective(record);
	}

	public Message selectByPrimaryKey(Integer messageId) {
		return messageMapper.selectByPrimaryKey(messageId);
	}

	public int updateByPrimaryKeySelective(Message record) {
		return messageMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Message record) {
		return messageMapper.updateByPrimaryKey(record);
	}

	public List<Message> selectByExample(Message message) {
		return messageMapper.selectByExample(message);
	}

	public Message selectByPrimary(Message message) {
		return messageMapper.selectByPrimary(message);
	}

	public List<UserMessage> selectAllMessageAndUser() {
		return messageMapper.selectAllMessageAndUser();
	}

	public int deleteByPrimary(Message message) {
		return messageMapper.deleteByPrimary(message);
	}

}
