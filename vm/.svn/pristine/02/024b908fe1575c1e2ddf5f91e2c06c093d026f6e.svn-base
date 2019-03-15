package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Admin;
import com.py.bean.AdminAndRole;
import com.py.bean.AdminRole;
import com.py.bean.Role;

public interface AdminRoleMapper {
    int deleteByPrimaryKey(Integer adminRoleId);

    int insert(AdminRole record);

    int insertSelective(AdminRole record);

    AdminRole selectByPrimaryKey(Integer adminRoleId);

    int updateByPrimaryKeySelective(AdminRole record);

    int updateByPrimaryKey(AdminRole record);
    
    List<AdminAndRole> selectAdminAndRole(Admin admin);

	List<AdminAndRole> selectAdminByRoleId(Role role);

	List<AdminAndRole> selectAdminByAdminId(Admin admin);

	List<AdminAndRole> selectByList(String[] aa);

	AdminRole selectAdminRoleByAdminId(@Param("adminId")Integer adminId);

	int deleteByArray(String[] adminIds);

	int deleteByAdminId(@Param("adminId")Integer adminId);
}