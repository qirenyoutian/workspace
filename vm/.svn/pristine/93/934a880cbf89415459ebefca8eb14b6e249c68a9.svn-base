package com.py.tomcatStart;

import java.net.ServerSocket;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 启动tomcat自动执行下面的类
 * 
 * @author Administrator
 *
 */
public class SocketServer implements ServletContextListener {
	private ServerSocket server;
	/**
	 * 启动tomcat执行
	 */
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//启动线程，走StartSocket，进入run()方法，创建服务器TCP Socket端口
		new Thread(new StartServerSocket()).start();
	}

	/**
	 * 关闭tomcat执行
	 */
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}
