package com.py.service;


import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Aisle;
import com.py.bean.Banner;
import com.py.bean.Equipment;
import com.py.bean.EquipmentClassify;
import com.py.bean.Point;
import com.py.dao.AisleMapper;
import com.py.dao.BannerMapper;
import com.py.dao.EquipmentClassifyMapper;
import com.py.dao.EquipmentMapper;
import com.py.dao.PointMapper;
import com.py.util.ExcelUtils;
import com.py.util.Msg;


@Service
public class EquipmentService {

	@Autowired
	EquipmentMapper equipmentMapper;
	@Autowired
	PointMapper pointMapper;
	@Autowired
	EquipmentClassifyMapper equipmentClassifyMapper;
	@Autowired
	AisleMapper aisleMapper;
	@Autowired
	BannerMapper bannerMapper;
	
	
	public int deleteByPrimaryKey(Integer equipmentId) {
		return equipmentMapper.deleteByPrimaryKey(equipmentId);
	}

	public int insert(Equipment record) {
		return equipmentMapper.insert(record);
	}

	public int insertSelective(Equipment record) {
		return equipmentMapper.insertSelective(record);
	}

	public Equipment selectByPrimaryKey(Integer equipmentId) {
		return equipmentMapper.selectByPrimaryKey(equipmentId);
	}

	public int updateByPrimaryKeySelective(Equipment record) {
		return equipmentMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Equipment record) {
		return equipmentMapper.updateByPrimaryKey(record);
	}
	
	public Equipment selectByPrimary(Equipment equipment) {
		return equipmentMapper.selectByPrimary(equipment);
	}
	
	public List<Equipment> selectByExample(Equipment equipment) {
		return equipmentMapper.selectByExample(equipment);
	}
	
	/**
	 * 查找所有的设备信息
	 * @param equipment
	 * @return
	 */
	public List<Equipment> selectAllEquipment(Equipment equipment) {
		
		List<Equipment> eq = equipmentMapper.selectAllEquipment(equipment);
		
		return eq;
	}
	
	/**
	 * 根据设备编号查找点位
	 * @param content
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public List<Point> selectEquipmentAndPoint(Equipment equipment) throws UnsupportedEncodingException {
		
		List<Point> pointList = pointMapper.selectByExampleInEquipment(equipment);
		return pointList;
		
		
	}

	/**
	 * 删除设备
	 * @param equipmenId
	 * @return
	 */
	public Msg deleteEquipment(Integer equipmentId,HttpServletRequest request) {
		
		//int b = Arrays.binarySearch(equipmentId,"0");
		
		if (equipmentId == 0) { //有0就是批量删除
			
			String[] equipmenIds = request.getParameterValues("equipmenIds");
			int a = equipmentMapper.deleteByArray(equipmenIds);
			////删除对应的货道信息
			aisleMapper.deleteAisleByEquipmentIds(equipmenIds);
			//获得对应设备的aisle_id
			List<Map<String,Object>>list=aisleMapper.selectAisleIdsByEquipmentIds(equipmenIds);
			if(list.size()>0){
				List<String>listnew=new ArrayList<String>();
				for(int n=0;list.size()>n;n++){
					String i=list.get(n).get("aisle_id").toString();
					listnew.add(i);
				}
				String[] aisleIds = new String[listnew.size()];
				listnew.toArray(aisleIds);
				aisleMapper.deleteAisleInventory(aisleIds);
			}	
			if (a == 2) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}else{   //单独删除
			int a = equipmentMapper.deleteByPrimaryKey(equipmentId);
			
			//删除对应的货道信息
			//删除aisle表中的信息
			aisleMapper.deleteByEquipmentId(equipmentId);
			//删除aisle_inventory中的信息
			//获得对应设备的aisle_id
			List<Map<String,Object>>list=aisleMapper.selectAisleIdByEquipmentId(equipmentId);
			if(list.size()>0){
				List<String>listnew=new ArrayList<String>();
				for(int n=0;list.size()>n;n++){
					String i=list.get(n).get("aisle_id").toString();
					listnew.add(i);
				}
				String[] aisleIds = new String[listnew.size()];
				listnew.toArray(aisleIds);
				aisleMapper.deleteAisleInventory(aisleIds);
			}	
			
			if (a == 1) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
		
	}
	/**
	 * 修改设备信息
	 * @param request
	 * @return
	 */
	public Msg updateEquipment(Equipment equipment) {
		
		
		int a = equipmentMapper.updateByPrimaryKeySelective(equipment);
		if (a == 1) {
			Aisle aisle = new Aisle();
			aisle.setAisleEquipmentId(equipment.getEquipmentId());
			List<Aisle> asList =  aisleMapper.selectByExample(aisle);
			if (asList != null) { //如果里面有货道先把原来的货道删除
				aisleMapper.deleteByEquipmentId(equipment.getEquipmentId());
			}
			
			//生成货道信息
			EquipmentClassify equipmentClassify = new EquipmentClassify();
			equipmentClassify.setEquipmentClassifyId(equipment.getEquipmentClassifyId());
			List<EquipmentClassify> byExample = equipmentClassifyMapper.selectByExample(equipmentClassify);
			int row = 0;
			int column = 0;
			for (EquipmentClassify ec : byExample) {
				row = ec.getEquipmentClassifyRow();
				column = ec.getEquipmentClassifyLine();
			}
			List<Aisle> list = new ArrayList<Aisle>();
			for (int i = 0; i < row; i++) {
				for (int j = 0; j < column; j++) {
					
					aisle.setAisleAbscissa(i);
					aisle.setAisleOrdinate(j);
					list.add(aisle);
				}
				//System.out.println(i);
			}
			int b = aisleMapper.insertSelectiveByAisle(list);
		
			if (b > 0) {
				return Msg.success();
			}
			else{
				return Msg.fail();
			}
			
		}else{
			return Msg.fail();
		}
	}
	/**
	 * 根据设备ID查找
	 * @param id
	 * @return
	 */
	public Equipment selectEquipmentById(Integer id) {
		
		Equipment equipment = new Equipment();
		equipment.setEquipmentId(id);
		Equipment eq = equipmentMapper.selectByPrimary(equipment);
		
		return eq;
	}

	
	
	/**
	 * 导出信息
	 * @param content
	 * @param response
	 * @throws Exception 
	 */
	public Msg ExportExcel(String content, HttpServletResponse response) throws Exception {
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Equipment equipment = new Equipment();
		 List<Point> equipmentList = null;
		 if (!content.equals("") && !content.equals(null) && !content.equals(" ")) {
			 String routeName = new String(content.getBytes("ISO-8859-1"),"UTF-8");
			 equipment.setEquipmentName(routeName);
		}
			equipmentList = pointMapper.selectByExampleInEquipment(equipment);
		 
		 
		 String[] headers = {"设备编号","设备IP","设备名称","设备类型","设备点位","设备状态","加入时间","更新时间" };  
		 String fileName = "设备信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 for (int i = 0; i < equipmentList.size(); i++) {
			 Point em = equipmentList.get(i);
				List<Equipment> eq = em.getEquipments();
				Object[] objs = new Object[headers.length];
				
				for (Equipment ep : eq) {
					objs[0] = ep.getEquipmentNumber();
					if (ep.getEquipmentIp() == null) {
						objs[1] = "null";
					} else {
						objs[1] = ep.getEquipmentIp();
					}
					if (ep.getEquipmentName() == null) {
						objs[2] = "null";
					} else {
						objs[2] = ep.getEquipmentName();
					}
					EquipmentClassify classify = ep.getEquipmentClassify();
					if (classify == null) {
						objs[3] = "null";
					} else {
						objs[3] = classify.getEquipmentClassifyName();
					}
					if (em.getPointName() == null) {
						objs[4] = "null";
					} else {
						objs[4] = em.getPointName();
					}
					int status = ep.getEquipmentStatus();
					if (status == 1) {
						objs[5] = "在线";
					}else{
						objs[5] = "离线";
					}
					if (ep.getEquipmentCreateTime() == null) {
						objs[6] = "null";
					} else {
						objs[6] = format.format(ep.getEquipmentCreateTime());
					}
					if (ep.getEquipmentChangeTime() == null) {
						objs[7] = "null";
					} else {
						objs[7] = format.format(ep.getEquipmentChangeTime());
					}
					
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/************************************************************** 设备类型管理 *******************************************************/

	
	
	
	public List<EquipmentClassify> selectEquipmentClassify(EquipmentClassify equipmentClassify) {
		// TODO Auto-generated method stub
		return equipmentClassifyMapper.selectByExample(equipmentClassify);
	}

	public int saveEquipmentClassify(EquipmentClassify equipmentClassify) {
		return equipmentClassifyMapper.insertSelective(equipmentClassify);
	}

	public Msg deleteEquipmentClassify(Integer equipmenClassifyId, String[] equipmenClassifyIds) {
		
		//int b = Arrays.binarySearch(equipmenClassifyId,"0");
		
		if (equipmenClassifyId == 0) { //有0就是批量删除
			
			//String[] equipmentClassifyIds = equipmenClassifyIds.getParameterValues("equipmentClassifyIds");
			
			int a = equipmentClassifyMapper.deleteByArray(equipmenClassifyIds); 
			if (a > 0) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}else{   //单独删除
			int a = equipmentClassifyMapper.deleteByPrimaryKey(equipmenClassifyId);
			
			if (a == 1) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}
	/**
	 * 根据ID查找设备类型
	 * @param equipmentClassifyId
	 * @return
	 */
	public EquipmentClassify selectEquipmentClassFiyById(Integer equipmentClassifyId) {
		return equipmentClassifyMapper.selectByPrimaryKey(equipmentClassifyId);
	}

	public int updateEquipmentClassfly(EquipmentClassify equipmentClassify) {
		return equipmentClassifyMapper.updateByPrimaryKeySelective(equipmentClassify);
	}

	public Equipment selectEquipment() {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	/************************************************************** 广告设置 *******************************************************/
	
	
	public List<Banner> selectBanner(Equipment equipment) {
		return bannerMapper.selectBannerAll(equipment);
	}

	public int insertBannerSelective(Banner b) {
		
		
		return bannerMapper.insertSelective(b);
	}

	public int updateBanner(Banner b) {
		
		
		return bannerMapper.updateByPrimaryKeySelective(b);
	}

	
	

}
