package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Admin;
import com.py.bean.AdminAndRole;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer adminId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer adminId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

	Admin selectByPrimary(Admin admin);

	List<Admin> selectByExample(Admin admin);

	List<Admin> selectByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	List<Admin> selectOperaByExample(Admin admin);

	int deleteByArray(String[] adminIds);

	List<Admin> selectAdminAndRole(Admin admin);
}