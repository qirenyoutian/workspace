package com.py.dao;



import org.apache.ibatis.annotations.Param;

import com.py.bean.ChannelPayment;

public interface ChannelPaymentMapper {
    int deleteByPrimaryKey(Integer channelPaymentId);

    int insert(ChannelPayment record);

    int insertSelective(ChannelPayment record);

    ChannelPayment selectByPrimaryKey(Integer channelPaymentId);

    int updateByPrimaryKeySelective(ChannelPayment record);

    int updateByPrimaryKey(ChannelPayment record);

	int deleteByChannelId(@Param("channelPaymentChannelId")Integer id);

	int deleteByArray(String[] channelIds);

}