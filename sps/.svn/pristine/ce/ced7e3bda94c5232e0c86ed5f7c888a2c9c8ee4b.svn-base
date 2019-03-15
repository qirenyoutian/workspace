package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Admin;
import com.py.bean.AdminClockInAndClockinTime;
import com.py.dao.AdminMapper;

@Service
public class AdminService {
	@Autowired
	AdminMapper adminMapper;
	public int deleteByPrimaryKey(Integer adminId) {
		return adminMapper.deleteByPrimaryKey(adminId);
	}

	public int insert(Admin record) {
		return adminMapper.insert(record);
	}

	public int insertSelective(Admin record) {
		return adminMapper.insertSelective(record);
	}

	public Admin selectByPrimary(Admin record) {
		return adminMapper.selectByPrimary(record);
	}
	
	public List<Admin> selectByExample(Admin record) {
		return adminMapper.selectByExample(record);
	}
	
	public int updateByPrimaryKeySelective(Admin record) {
		return adminMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Admin record) {
		return adminMapper.updateByPrimaryKey(record);
	}
	
	public List<AdminClockInAndClockinTime> selectAdminAndClockByTime(String startTime, String endTime){
		return adminMapper.selectAdminAndClockByTime(startTime, endTime);
		
	}
	
	public List<AdminClockInAndClockinTime> selectByExampleWithTimeAndClockin(AdminClockInAndClockinTime adminClockIn){
		return adminMapper.selectByExampleWithTimeAndClockin(adminClockIn);
		
	}

	public Admin selectByPrimaryKey(Integer adminId) {
		return adminMapper.selectByPrimaryKey(adminId);
	}
	
	
	
	
	
	
	
	
}
