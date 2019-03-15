package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.ChannelMerchandise;

public interface ChannelMerchandiseMapper {
    int deleteByPrimaryKey(Integer channelMerchandiseId);

    int insert(ChannelMerchandise record);

    int insertSelective(ChannelMerchandise record);

    ChannelMerchandise selectByPrimaryKey(Integer channelMerchandiseId);

    int updateByPrimaryKeySelective(ChannelMerchandise record);

    int updateByPrimaryKey(ChannelMerchandise record);

	List<ChannelMerchandise> selectByExample(ChannelMerchandise channelMerchandise);

	ChannelMerchandise getQRCodeByUrl(@Param("paymentId")Integer paymentId,
			@Param("equipmentId")Integer equipmentId,
			@Param("merchandiseId")Integer merchandiseId);

	ChannelMerchandise selectByProductId(ChannelMerchandise channelMerchandise);
	
	List<ChannelMerchandise> selectChannelMerchandiseByExample(ChannelMerchandise channelMerchandise);



}