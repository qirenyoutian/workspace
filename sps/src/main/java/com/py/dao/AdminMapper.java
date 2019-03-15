package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Admin;
import com.py.bean.AdminClockInAndClockinTime;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer adminId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer adminId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

	Admin selectByPrimary(Admin record);

	List<Admin> selectByExample(Admin record);

	List<AdminClockInAndClockinTime> selectAdminAndClockByTime(@Param("startTime")String startTime,@Param("endTime")String endTime);

	List<AdminClockInAndClockinTime> selectByExampleWithTimeAndClockin(AdminClockInAndClockinTime adminClockIn);
}