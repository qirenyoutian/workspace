package com.py.messageListener;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.py.dao.AisleInventoryMapper;
import com.py.dao.AisleMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.EquipmentMapper;
import com.py.dao.OrderMapper;
import com.py.dao.OrderMessageMapper;
import com.py.dao.SingleMapper;

public class MyMessageListener implements MessageListener {
	private static ExecutorService fixedThreadPool = Executors.newFixedThreadPool(20);
	private ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	private ChannelMerchandiseMapper channelMerchandiseMapper = ioc.getBean(ChannelMerchandiseMapper.class);
	private OrderMapper orderMapper = ioc.getBean(OrderMapper.class);
	private EquipmentMapper equipmentMapper = ioc.getBean(EquipmentMapper.class);
	private AisleInventoryMapper aisleInventoryMapper = ioc.getBean(AisleInventoryMapper.class);
	private AisleMapper aisleMapper = ioc.getBean(AisleMapper.class);
	private SingleMapper singleMapper = ioc.getBean(SingleMapper.class);
	private OrderMessageMapper orderMessageMapper = ioc.getBean(OrderMessageMapper.class);
	
	@Override
	public void onMessage(Message message) {
		try {
			TextMessage textMessage = (TextMessage) message;
			// 取消息内容
			String json = textMessage.getText();
			System.out.println("收到的消息："+json);
			fixedThreadPool.execute(new MessageThread(channelMerchandiseMapper,orderMapper,equipmentMapper,aisleInventoryMapper,aisleMapper,singleMapper,orderMessageMapper,json));
		} catch (JMSException e) {
			//logger.error
		}
	}
	
	
	
}
