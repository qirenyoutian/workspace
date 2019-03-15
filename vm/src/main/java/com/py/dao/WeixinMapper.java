package com.py.dao;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Weixin;

public interface WeixinMapper {
    int deleteByPrimaryKey(Integer weixinId);

    int insert(Weixin record);

    int insertSelective(Weixin record);

    Weixin selectByPrimaryKey(Integer weixinId);

    int updateByPrimaryKeySelective(Weixin record);

    int updateByPrimaryKey(Weixin record);

	Weixin selectByCommercialTenantId(@Param("commercialTenantId")Integer commercialTenantId);
}