package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.ServiceTel;
import com.py.dao.ServiceTelMapper;

@Service
public class ServiceTelService {

	@Autowired
	ServiceTelMapper serviceTelMapper;
	
	public ServiceTel selectByPrimaryKey(Integer id) {
		return serviceTelMapper.selectByPrimaryKey(id);
	}
	
}
