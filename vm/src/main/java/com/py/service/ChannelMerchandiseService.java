package com.py.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.ChannelMerchandise;
import com.py.bean.Merchandise;
import com.py.bean.Payment;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.MerchandiseMapper;
import com.py.dao.PaymentMapper;
import com.py.util.Msg;

@Service
public class ChannelMerchandiseService {

	@Autowired
	private ChannelMerchandiseMapper channelMerchandiseMapper;
	@Autowired
	private PaymentMapper paymentMapper;
	@Autowired
	private MerchandiseMapper merchandiseMapper;
	
	
	
	
	
	
	
	

	public List<ChannelMerchandise> selectByExample(ChannelMerchandise channelMerchandise) {
		
		
		
		return channelMerchandiseMapper.selectByExample(channelMerchandise);
	}
	/**
	 * 保存渠道商品
	 * @param request
	 * @return
	 */
	public int saveMerchandise(HttpServletRequest request) {
		String channelMerchandiseChannelId = request.getParameter("channelMerchandiseChannelId");
		String merchandiseId = request.getParameter("merchandiseId");
		String channelMerchandiseNumber = request.getParameter("channelMerchandiseNumber");
		String channelMerchandiseMerchandiseUrl = request.getParameter("channelMerchandiseMerchandiseUrl");
		String channelMerchandisePrice = request.getParameter("channelMerchandisePrice");
		String channelMerchandiseChannelName = request.getParameter("channelMerchandiseChannelName");
		
		
		ChannelMerchandise channelMerchandise  = new ChannelMerchandise();
		channelMerchandise.setChannelMerchandiseChannelId(Integer.parseInt(channelMerchandiseChannelId));
		channelMerchandise.setChannelMerchandiseMerchandiseId(Integer.parseInt(merchandiseId));
		channelMerchandise.setChannelMerchandiseNumber(channelMerchandiseNumber);
		channelMerchandise.setChannelMerchandiseMerchandiseUrl(channelMerchandiseMerchandiseUrl);
		channelMerchandise.setChannelMerchandiseName(channelMerchandiseChannelName);
		channelMerchandise.setChannelMerchandisePrice(Double.valueOf(channelMerchandisePrice));
		channelMerchandise.setChannelMerchandiseCreateTime(new Date());
		channelMerchandise.setChannelMerchandiseUpdateTime(new Date());
		
		int a = channelMerchandiseMapper.insertSelective(channelMerchandise);
		return a;
	}

	public ChannelMerchandise selectByPrimaryKey(Integer id) {
		return channelMerchandiseMapper.selectByPrimaryKey(id);
	}
	/**
	 * 修改渠道商品对应关系
	 * @param request
	 * @return
	 */
	public Msg merchandise(HttpServletRequest request) {
		String channelMerchandiseId = request.getParameter("channelMerchandiseId");
		String channelMerchandiseMerchandiseId = request.getParameter("merchandiseId");
		String channelMerchandisePrice = request.getParameter("channelMerchandisePrice");
		String channelMerchandiseNumber = request.getParameter("channelMerchandiseNumber");
		String channelMerchandiseChannelName = request.getParameter("channelMerchandiseChannelName");
		String channelMerchandiseMerchandiseUrl = request.getParameter("channelMerchandiseMerchandiseUrl");
		
		
		ChannelMerchandise channelMerchandise  = new ChannelMerchandise();
		channelMerchandise.setChannelMerchandiseId(Integer.parseInt(channelMerchandiseId));
		channelMerchandise.setChannelMerchandiseMerchandiseId(Integer.parseInt(channelMerchandiseMerchandiseId));
		channelMerchandise.setChannelMerchandiseNumber(channelMerchandiseNumber);
		channelMerchandise.setChannelMerchandisePrice(Double.valueOf(channelMerchandisePrice));
		channelMerchandise.setChannelMerchandiseMerchandiseUrl(channelMerchandiseMerchandiseUrl);
		channelMerchandise.setChannelMerchandiseName(channelMerchandiseChannelName);
		
		int a = channelMerchandiseMapper.updateByPrimaryKeySelective(channelMerchandise);
		if (a == 1) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
		
	}

	public int deleteByPrimaryKey(Integer id) {
		return channelMerchandiseMapper.deleteByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(ChannelMerchandise channelMerchandise) {
		return channelMerchandiseMapper.updateByPrimaryKeySelective(channelMerchandise);
	}

	public List<ChannelMerchandise> selectChannelMerchandiseByExample(ChannelMerchandise channelMerchandise) {
		
		return channelMerchandiseMapper.selectChannelMerchandiseByExample(channelMerchandise);
	}

	public List<Payment> getPaymentByChannelIdAndCommercialTenantId(Integer commercialTenantId, Integer channelId) {
		
		
		
		return paymentMapper.getPaymentByChannelIdAndCommercialTenantId(commercialTenantId,channelId);
	}
}
