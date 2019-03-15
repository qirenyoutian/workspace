package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.PushMessage;
import com.py.dao.PushMessageMapper;

@Service
public class PushMessageService {
	
	@Autowired
	PushMessageMapper pushMessageMapper;

	public int deleteByPrimaryKey(Integer pushMessageId) {
		// TODO Auto-generated method stub
		return pushMessageMapper.deleteByPrimaryKey(pushMessageId);
	}

	public int insert(PushMessage record) {
		// TODO Auto-generated method stub
		return pushMessageMapper.insert(record);
	}

	public int insertSelective(PushMessage record) {
		// TODO Auto-generated method stub
		return pushMessageMapper.insertSelective(record);
	}

	public PushMessage selectByPrimaryKey(Integer pushMessageId) {
		// TODO Auto-generated method stub
		return pushMessageMapper.selectByPrimaryKey(pushMessageId);
	}

	public int updateByPrimaryKeySelective(PushMessage record) {
		// TODO Auto-generated method stub
		return pushMessageMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(PushMessage record) {
		// TODO Auto-generated method stub
		return pushMessageMapper.updateByPrimaryKey(record);
	}

	public List<PushMessage> selectByExample(PushMessage pushMessage) {
		// TODO Auto-generated method stub
		return pushMessageMapper.selectByExample(pushMessage);
	}

	public PushMessage selectByPrimary(PushMessage pushMessage) {
		// TODO Auto-generated method stub
		return pushMessageMapper.selectByPrimary(pushMessage);
	}
	
	
	
}
