package com.py.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Invoice;
import com.py.bean.SingleCar;
import com.py.bean.User;
import com.py.bean.UserInvoice;
import com.py.bean.UserRecord;
import com.py.dao.UserMapper;

@Service
public class UserService{
	@Autowired
	UserMapper userMapper;
	public int deleteByPrimaryKey(Integer userId) {
		return userMapper.deleteByPrimaryKey(userId);
	}

	public int insert(User record) {
		return userMapper.insert(record);
	}

	public int insertSelective(User record) {
		return userMapper.insertSelective(record);
	}

	public User selectByPrimary(User record) {
		return userMapper.selectByPrimary(record);
	}
    
	public List<User> selectByExample(User record) {
		return userMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(User record) {
		return userMapper.updateByPrimaryKey(record);
	}

	public User selectByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}
	
	public List<UserRecord> queryAllTradingRecordAndUser(){
		return userMapper.queryAllTradingRecordAndUser();
	}	
	
	public List<UserRecord> selectAllIncomeByTime(String startTime, String endTime){
		return userMapper.selectAllIncomeByTime(startTime, endTime);
	}

	public List<UserRecord> SelectAllSingleCarByRoute(SingleCar singleCar) {
		return userMapper.selectAllSingleCarByRoute(singleCar);
	}

	public List<UserInvoice> selectExsampleWithInvoice(User user) {
		return userMapper.selectExsampleWithInvoice(user);
	}

	public List<UserInvoice> selectAllInvoiceByTime(String startTime, String endTime) {
		return userMapper.selectAllInvoiceByTime(startTime,endTime);
		
	}

	public List<UserInvoice> selectAllInvoiceByType(Invoice invoice) {
		return userMapper.selectAllInvoiceByType(invoice);
		
	}

	public int updateForStatusById(Integer invoiceId, Integer status) {
		return userMapper.updateForStatusById(invoiceId,status);
	}

	public List<User> selectByTimeQuantum(Map<String, String> map) {
		return userMapper.selectByTimeQuantum(map);
	}

	public List<User> selectByExampleTop10(User user) {
		return userMapper.selectByExampleTop10(user);
	}

	public int countUser() {
		return userMapper.countUser();
	}
	
}
