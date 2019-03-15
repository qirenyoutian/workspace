package com.py.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Channel;
import com.py.bean.ChannelPayment;
import com.py.dao.ChannelMapper;
import com.py.dao.ChannelPaymentMapper;
import com.py.util.Msg;

@Service
public class ChannelService {
	
	@Autowired
	private ChannelMapper channelMapper;
	@Autowired
	ChannelPaymentMapper channelPaymentMapper;
	
	

	public List<Channel> selectByExample(Channel channel) {
		return channelMapper.selectByExample(channel);
	}

	public List<Channel> selectByTime(String startTime, String endTime) {
		return channelMapper.selectByTime(startTime, endTime);
	}
	/**
	 * 保存渠道信息
	 * @param request
	 * @return
	 */
	public int savechannel(HttpServletRequest request) {
		String name = request.getParameter("channelName");
		String contact = request.getParameter("channelContact");
		String contact_way = request.getParameter("channelContactWay");
		String style = request.getParameter("channelStyle");
		String interface_address = request.getParameter("channelSingleInterfaceAddress");
		String checkstand_address = request.getParameter("channelCheckstandAddress");
		
		
		Channel channel = new Channel();
		channel.setChannelName(name);
		channel.setChannelContact(contact);
		channel.setChannelContactWay(contact_way);
		channel.setChannelStyle(style);
		channel.setChannelSingleInterfaceAddress(interface_address);
		channel.setChannelCheckstandAddress(checkstand_address);
		channel.setChannelChangeTime(new Date());
		channel.setChannelCreateTime(new Date());
		
		int a = channelMapper.insertSelective(channel);
		
		String[] pay_type = request.getParameterValues("paymentName");
		if (pay_type != null) {
			if (pay_type.length != 0) {
				ChannelPayment channelPayment = new ChannelPayment();
				for (String payment : pay_type) {
					channelPayment.setChannelPaymentChannelId(channel.getChannelId());
					channelPayment.setChannelPaymentPaymentId(Integer.parseInt(payment));
					channelPaymentMapper.insertSelective(channelPayment);
				}
			}
		}
		
		return a;
	}
	/**
	 * 根据Primary查找
	 * @param channel
	 * @return
	 */
	public Channel selectByPrimary(Channel channel) {
		return channelMapper.selectByPrimaryKey(channel);
	}
	/**
	 * 修改渠道信息
	 * @param request
	 * @return
	 */
	public Msg updateChannel(HttpServletRequest request) {
		String id = request.getParameter("channelId");
		String name = request.getParameter("channelName");
		String contact = request.getParameter("channelContact");
		String contact_way = request.getParameter("channelContactWay");
		String style = request.getParameter("channelStyle");
		String interface_address = request.getParameter("channelSingleInterfaceAddress");
		String checkstand_address = request.getParameter("channelCheckstandAddress");

		
		Channel channel = new Channel();
		channel.setChannelId(Integer.parseInt(id));
		channel.setChannelName(name);
		channel.setChannelContact(contact);
		channel.setChannelContactWay(contact_way);
		channel.setChannelStyle(style);
		channel.setChannelSingleInterfaceAddress(interface_address);
		channel.setChannelCheckstandAddress(checkstand_address);
		channel.setChannelChangeTime(new Date());
		channelMapper.updateByPrimaryKeySelective(channel);//修改渠道信息
		
		String[] pay_type = request.getParameterValues("paymentName");
		if (pay_type != null) {
			if (pay_type.length != 0) {
				channelPaymentMapper.deleteByChannelId(Integer.parseInt(id));//先把之前的支付方式清除掉
				for (String payment : pay_type) {//重新添加支付方式
					ChannelPayment channelPayment = new ChannelPayment();
					channelPayment.setChannelPaymentChannelId(Integer.parseInt(id));
					channelPayment.setChannelPaymentPaymentId(Integer.parseInt(payment));
					channelPaymentMapper.insertSelective(channelPayment);
				}
			}
		}
		return Msg.success();
	}
	/**
	 * 根据渠道ID查询支付方式
	 * @param channelId
	 * @return
	 */
	public List<Channel> selectPaymentByChannelId(Integer channelId) {
		
		
		
		return channelMapper.selectChannelAndPaymentByChannelId(channelId);
	}
	
	/**
	 * 删除渠道
	 * @param channelId
	 * @param channelIds
	 * @return
	 */
	
	public Msg delectChannel(Integer channelId, String[] channelIds) {
		
		if (channelId == 0) {
			int a = channelMapper.deleteByArray(channelIds); 
			int b = channelPaymentMapper.deleteByArray(channelIds);
			if (a > 0 && b > 0) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
			
		}else{
			int a = channelMapper.deleteByPrimaryKey(channelId);
			int b = channelPaymentMapper.deleteByChannelId(channelId);
			if (a == 1 && b == 1) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}

}
