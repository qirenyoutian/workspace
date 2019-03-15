package com.py.tomcatStart;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.py.dao.EquipmentMapper;
import com.py.socket.HairUtil;
import com.py.socket.ServerThread;

public class StartServerSocket implements Runnable {
	private ServerSocket server;
	private ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	private EquipmentMapper equipmentMapper = ioc.getBean(EquipmentMapper.class);
	@Override
	public void run() {
		try {
			// 服务端在9011端口监听客户端请求的TCP连接
			server = new ServerSocket(9502);
			System.out.println("启动成功，端口为："+9502);
			Socket socket = null;
			boolean f = true;
			while (f) {
				// 等待客户端的连接，如果没有获取连接
				socket = server.accept();
				// 为每个客户端连接开启一个线程
				String address = socket.getInetAddress().getHostAddress();
				if(HairUtil.map.get(address) == null) {
					new Thread(new ServerThread(socket,equipmentMapper)).start();
		  	 	}
			}
			server.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
