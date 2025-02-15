package com.py.socket;

import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import com.py.bean.Equipment;
import com.py.dao.EquipmentMapper;
import com.py.util.OfTime;
import com.py.util.SocketSpace;

/**
 * 该类为多线程类，用于服务端
 */
public class ServerThread implements Runnable {
	private SocketSpace socketSpace = new SocketSpace();
	private EquipmentMapper equipmentMapper = null;
	private String time = OfTime.getLongTime();
	private String address;
	private int num = 0;
	private String data;
	private String[] dataArrays;
	private boolean flag = true;
	
	public ServerThread(Socket socket ,EquipmentMapper equipmentMapper) {
		this.equipmentMapper = equipmentMapper;
		try {
			this.socketSpace.setSocket(socket);
			this.socketSpace.setIs(socket.getInputStream());
			this.socketSpace.setOut(new PrintStream(socket.getOutputStream()));
			address = socketSpace.getSocket().getInetAddress().getHostAddress();//客户端ip
			System.out.println(address+"已连接成功！");
			this.mapPut();//判斷是否存在該socket
			this.Timer();//开启定时器去检测心跳,判断设备socket是否断开
		} catch (IOException e) {
			HairUtil.socketClose(address, equipmentMapper);
			flag = false;
		}
	}

	@Override
	public void run() {
		try {
			byte b[] = new byte[1024];
			while (flag) {
				System.out.println("当前连接数："+HairUtil.map.size());
				int blen = socketSpace.getIs().read(b);// 接收从客户端发送过来的数据
				time = OfTime.getLongTime();//接收到消息的時間
				this.Timer();
				if (blen <= 0) {//客戶端主動中短
					HairUtil.socketClose(address, equipmentMapper);
					flag = false;
				} else {
					data = new String(b);
					data = HairUtil.replaceSpecialStr(data);//客户端发的数据
					System.out.println(data);
					dataArrays = data.replaceAll(" ",",").split(",");
					switch (dataArrays[0]) {//判断是以AA开头的数据为上传设备编号的指令,例如：AA (设备编号) (BB)
					case "AA":
						this.uploadDeviceNumber(dataArrays);
						break;
					}
				}
			}
		} catch (Exception e) {
			HairUtil.socketClose(address, equipmentMapper);
			flag = false;
		}
	}
	//判断HairUtil的map是否已存在该客户端地址的socket,无则添加,并且判断数据库是否已有该设备，如有则让它上线;有则先删除
	private void mapPut() {
		if(HairUtil.map.get(address) != null) {
			HairUtil.socketClose(address, equipmentMapper);
  	 	}
		HairUtil.map.put(address, socketSpace);
		Equipment equipment = new Equipment();
		equipment.setEquipmentSocketKey(address);
		Equipment findEquipment = equipmentMapper.selectByPrimary(equipment);
		if(findEquipment != null) {
			if (findEquipment.getEquipmentStatus() == 2) {
				findEquipment.setEquipmentStatus(2);//停用
			}else{
				findEquipment.setEquipmentStatus(1);//在线
			}
			findEquipment.setEquipmentIp(address);
			findEquipment.setEquipmentSocketKey(address);
			findEquipment.setEquipmentChangeTime(new Date());
			try {
				equipmentMapper.updateByPrimaryKeySelective(findEquipment);
			} catch (Exception e) {
				HairUtil.socketClose(address, equipmentMapper);
				flag = false;
			}
		}
	}
	
	//上传设备编号指令,为节约数据库资源,心跳不可发AA 开头的指令
	private void uploadDeviceNumber(String[] dataArrays) throws IOException {
		Equipment equipment = new Equipment();
		equipment.setEquipmentNumber(dataArrays[1]);
		//查询数据库是否有此设备
		Equipment findEquipment = equipmentMapper.selectByPrimary(equipment);
		if(findEquipment == null) {//无则添加
			equipment.setEquipmentIp(address);
			equipment.setEquipmentSocketKey(address);
			equipment.setEquipmentCreateTime(new Date());
			try {
				equipmentMapper.insertSelective(equipment);
				HairUtil.put(String.valueOf(equipment.getEquipmentId()), address);
			} catch (Exception e) {
				HairUtil.socketClose(address, equipmentMapper);
				flag = false;
			}
		}else {
			if (findEquipment.getEquipmentStatus() == 2) {
				findEquipment.setEquipmentStatus(2);//停用
			}else{
				findEquipment.setEquipmentStatus(1);//在线
			}
			findEquipment.setEquipmentIp(address);
			findEquipment.setEquipmentSocketKey(address);
			findEquipment.setEquipmentChangeTime(new Date());
			try {
				equipmentMapper.updateByPrimaryKeySelective(findEquipment);
				System.out.println(findEquipment.getEquipmentId());
				HairUtil.put(String.valueOf(findEquipment.getEquipmentId()), address);
			} catch (Exception e) {
				HairUtil.socketClose(address, equipmentMapper);
				flag = false;
			}
		}
	}
	
	/**
	 * 定时器，监听心跳包
	 */
	private void Timer(){
		if(flag) {
			Timer timer = new Timer();
			timer.schedule(new TimerTask() {
				public void run() {
					int timeLength = HairUtil.getTimeDifference(OfTime.getLongTime(),time);
					if(timeLength <= 3){
						System.out.println(address+"没断开");
						time = OfTime.getLongTime();
						n um = 0;
					}else{
						if(num < 5){
							Timer();
							num++;
						}else{//断开超过5次
							HairUtil.socketClose(address, equipmentMapper);
							flag = false;
						}
						System.out.println(address+"已断开："+"第"+num+"次");
					}
				}
			}, 6000);
		}
	}
	
}