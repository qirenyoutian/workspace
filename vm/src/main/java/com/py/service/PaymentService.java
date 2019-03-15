package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.ChannelPayment;
import com.py.bean.Payment;
import com.py.dao.ChannelPaymentMapper;
import com.py.dao.PaymentMapper;

@Service
public class PaymentService {

	@Autowired
	PaymentMapper paymentMapper;
	@Autowired
	ChannelPaymentMapper channelPaymentMapper;
	
	
	
	public int deleteByPrimaryKey(Integer paymentId) {
		
		
		return 0;
	}

	public int insert(Payment record) {
		
		return 0;
	}

	public int insertSelective(Payment record) {
		
		return 0;
	}

	public Payment selectByPrimaryKey(Integer paymentId) {
		
		return null;
	}

	public int updateByPrimaryKeySelective(Payment record) {
		
		return 0;
	}

	public int updateByPrimaryKey(Payment record) {
		
		return 0;
	}

	public List<Payment> getPaymentByAisleId(Integer aisle_id) {
		
		return null;
	}

	public List<Payment> selectByExample(Payment payment) {
		// TODO Auto-generated method stub
		
		return paymentMapper.selectByExample(payment);
	}

	
}
