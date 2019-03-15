package com.py.service;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Equipment;
import com.py.bean.EquipmentMessage;
import com.py.dao.EquipmentMessageMapper;
import com.py.util.ExcelUtils;
import com.py.util.Msg;

@Service
public class EquipmentMessageService {
	@Autowired
	EquipmentMessageMapper equipmentMessageMapper;
	
	
	public int deleteByPrimaryKey(Integer equipmentMessageId) {
		return equipmentMessageMapper.deleteByPrimaryKey(equipmentMessageId);
	}

	public int insert(EquipmentMessage record) {
		return equipmentMessageMapper.insert(record);
	}

	public int insertSelective(EquipmentMessage record) {
		return equipmentMessageMapper.insertSelective(record);
	}

	public EquipmentMessage selectByPrimaryKey(Integer equipmentMessageId) {
		return equipmentMessageMapper.selectByPrimaryKey(equipmentMessageId);
	}

	public int updateByPrimaryKeySelective(EquipmentMessage record) {
		return equipmentMessageMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(EquipmentMessage record) {
		return equipmentMessageMapper.updateByPrimaryKey(record);
	}

	public EquipmentMessage selectByPrimary(EquipmentMessage equipmentMessage) {
		return equipmentMessageMapper.selectByPrimary(equipmentMessage);
	}
	
	public List<EquipmentMessage> selectByExample(Equipment equipment) {
		List<EquipmentMessage> EquipmentList = equipmentMessageMapper.selectByExample(equipment);
		return EquipmentList;
	}

	/**
	 * 设备信息导出表格
	 * @param content  输入的信息
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public Msg ExportExcel(String content, HttpServletResponse response) throws Exception{
		
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Equipment equipment = new Equipment();
		 List<EquipmentMessage> equipmentList = null;
		 if (!content.equals("") && !content.equals(null) && !content.equals(" ")) {
			 String routeName = new String(content.getBytes("ISO-8859-1"),"UTF-8");
			 equipment.setEquipmentNumber(routeName);
		}
			equipmentList = equipmentMessageMapper.selectByExample(equipment);
		 
		 
		 String[] headers = {"设备编号","设备名称","设备类型","设备信号强度","CPU占用","内存占用","内存大小","软件版本","更新时间" };  
		 String fileName = "设备信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 for (int i = 0; i < equipmentList.size(); i++) {
			 EquipmentMessage em = equipmentList.get(i);
			List<Equipment> trsc = em.getEqList();
			for (Equipment ep : trsc) {
				Object[] objs = new Object[headers.length];
				objs[0] = ep.getEquipmentNumber();
				objs[1] = ep.getEquipmentName();
				objs[2] = ep.getEquipmentClassifyId();
				objs[3] = em.getEquipmentMessageSignalStrength();
				objs[4] = em.getEquipmentMessageCpuOccupy();
				objs[5] = em.getEquipmentMessageMemoryOccupy();
				objs[6] = em.getEquipmentMessageMemorySize();
				objs[7] = em.getEquipmentMessageVersions();
				objs[8] = format.format(em.getEquipmentMessageChangeTime());
				
				dataList.add(objs);
			}
		}
		 
		/*for (int i = 0; i < dataList.size() - 1; i++) {
			for (int j = 0; j < dataList.size() - 1 - i; j++) {
				if(format.parse((String)dataList.get(j)[7]).getTime() < format.parse((String)dataList.get(j+1)[7]).getTime()){  
					Object[] objects = dataList.get(j);
					dataList.set(j, dataList.get(j + 1));
					dataList.set(j + 1, objects);
               } 
			}
		}*/
		
      ExcelUtils ex = new ExcelUtils(fileName,headers,dataList);
		
		try{
			OutputStream output = response.getOutputStream();
          response.reset();
          response.setHeader("Content-disposition",
                  "attachment; filename=PersonList.xls");
          response.setContentType("application/msexcel");
          ex.export(output);
          output.close();
          return Msg.success();
		
		}catch(IOException e){
			e.printStackTrace();
			return Msg.fail();
		}
		
		//return equipmentList;
		
	}

}
