package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.BankCard;
import com.py.dao.BankCardMapper;

@Service
public class BankCardService {
	@Autowired
	BankCardMapper bankCardMapper;
	public int deleteByPrimaryKey(Integer bankCardId) {
		return bankCardMapper.deleteByPrimaryKey(bankCardId);
	}

	public int insert(BankCard record) {
		return bankCardMapper.insert(record);
	}

	public int insertSelective(BankCard record) {
		return bankCardMapper.insertSelective(record);
	}

	public BankCard selectByPrimary(BankCard record) {
		return bankCardMapper.selectByPrimary(record);
	}
    
	public List<BankCard> selectByExample(BankCard record) {
		return bankCardMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(BankCard record) {
		return bankCardMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(BankCard record) {
		return bankCardMapper.updateByPrimaryKey(record);
	}
}
