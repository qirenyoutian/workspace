package com.py.dao;

import com.py.bean.AdminPoint;

public interface AdminPointMapper {
    int deleteByPrimaryKey(Integer adminPointId);

    int insert(AdminPoint record);

    int insertSelective(AdminPoint record);

    AdminPoint selectByPrimaryKey(Integer adminPointId);

    int updateByPrimaryKeySelective(AdminPoint record);

    int updateByPrimaryKey(AdminPoint record);

	AdminPoint selectByAdminId(Integer adminId);

	AdminPoint selectByPrimary(AdminPoint adminPoint);
}