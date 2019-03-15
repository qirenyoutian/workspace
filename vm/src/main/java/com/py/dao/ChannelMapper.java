package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Channel;
import com.py.bean.ChannelMerchandise;

public interface ChannelMapper {
    int deleteByPrimaryKey(Integer channelId);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(Channel record);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);
    
    List<Channel> selectByExample(Channel channel);
    
    List<Channel> selectByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	List<Channel> selectPayTypeByChannelId(@Param("channelId")Integer channelId);

	List<Channel> selectChannelAndPaymentByChannelId(@Param("channelId")Integer channelId);

	int deleteByArray(String[] channelIds);

	
}