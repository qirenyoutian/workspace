package com.py.service;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Channel;
import com.py.bean.CommercialTenant;
import com.py.bean.Equipment;
import com.py.bean.EquipmentClassify;
import com.py.bean.Merchandise;
import com.py.bean.MerchandiseClassify;
import com.py.bean.Point;
import com.py.dao.MerchandiseClassifyMapper;
import com.py.dao.MerchandiseMapper;
import com.py.util.ExcelUtils;
import com.py.util.Msg;

@Service
public class MerchandiseService {

	@Autowired
	MerchandiseMapper merchandiseMapper;
	@Autowired
	MerchandiseClassifyMapper classifyMapper;

	public int updateByPrimaryKeySelective(Merchandise record) {
		return merchandiseMapper.updateByPrimaryKeySelective(record);
	}
	
	public int deleteByPrimaryKey(Integer merchandiseId) {
		return merchandiseMapper.deleteByPrimaryKey(merchandiseId);
	}
	
	public int insert(Merchandise record) {
		return merchandiseMapper.insert(record);
	}

	public int insertSelective(Merchandise record) {
		return merchandiseMapper.insertSelective(record);
	}

	public int updateByPrimaryKey(Merchandise record) {
		return merchandiseMapper.updateByPrimaryKey(record);
	}
	
	public Merchandise selectByPrimary(Merchandise merchandise) {
		return merchandiseMapper.selectByPrimary(merchandise);
	}
	
	public List<Merchandise> selectByExample(Merchandise merchandise) {
		return merchandiseMapper.selectByExample(merchandise);
	}
	
	public Merchandise selectByPrimaryKey(Integer merchandiseId) {
		return merchandiseMapper.selectByPrimaryKey(merchandiseId);
	}

	public List<Merchandise> selectByTime(String startTime,String endTime) {
		return merchandiseMapper.selectByTime(startTime, endTime);
	}
	
	

	public void ExportExcel(String commerName, Integer merchandiseName, Integer classfiy, Integer status, Integer from,
			String startTime, String endTime, HttpServletResponse response) throws Exception {
		
		
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Merchandise merchandise = new Merchandise();
		 List<Merchandise> menuList = null;
		 if (!commerName.equals("") && !commerName.equals(" ")) {
				merchandise.setMerchandiseCommercialTenantNumber(commerName);
			}
			if (merchandiseName != null) {
				merchandise.setMerchandiseId(merchandiseName);
			}
			if (classfiy != null) {
				merchandise.setMerchandiseClassify(classfiy);
			}
			if (status != null) {
				merchandise.setMerchandiseStatus(status);
			}
			if (from != null) {
				merchandise.setMerchandiseInformationComefrom(from);
			}
			if (startTime != null && !("").equals(startTime.trim()) && endTime != null  && !("").equals(endTime.trim())) {
				menuList = merchandiseMapper.selectByTime(startTime, endTime);
			}else{
				menuList = merchandiseMapper.selectByExample(merchandise);
			}
		 
		 String[] headers = {"商品名称","商品编号","商户名称","商品分类","商品价格","商品图片","商品来源","加入时间","上架时间","更新时间" };  
		 String fileName = "商品信息表";  
		 List<Object[]> dataList = new ArrayList<Object[]>();
		 for (int i = 0; i < menuList.size(); i++) {
			 Merchandise md = menuList.get(i);
			 CommercialTenant tenant = md.getCommercialTenant();
			 MerchandiseClassify classify = md.getClassify();
			 Channel channel = md.getChannel();
				Object[] objs = new Object[headers.length];
				objs[0] = (md.getMerchandiseName()) == null ? "null" : md.getMerchandiseName();
				objs[1] = (md.getMerchandiseNumber()) == null ? "null" : md.getMerchandiseNumber();
				objs[2] = (tenant.getCommercialTenantName()) == null ? "null" : tenant.getCommercialTenantName();
				objs[3] = (classify.getMerchandiseClassifyName()) == null ? "null" : classify.getMerchandiseClassifyName();
				objs[4] = (md.getMerchandisePrice()) == null ? "null" : md.getMerchandisePrice();
				objs[5] = (md.getMerchandiseImageUrl()) == null ? "null" : md.getMerchandiseImageUrl();
				objs[6] = (channel.getChannelName()) == null ? "null" : channel.getChannelName();
				objs[7] = (md.getMerchandiseTime()) == null ? "null" : format.format(md.getMerchandiseTime());
				objs[8] = (md.getMerchandiseUploadTime()) == null ? "null" : format.format(md.getMerchandiseUploadTime());
				objs[9] = (md.getMerchandiseUpdateTime()) == null ? "null" : format.format(md.getMerchandiseUpdateTime());
				
				dataList.add(objs);
		}
		
      ExcelUtils ex = new ExcelUtils(fileName,headers,dataList);
		
		try{
			OutputStream output = response.getOutputStream();
          response.reset();
          response.setHeader("Content-disposition",
                  "attachment; filename=PersonList.xls");
          response.setContentType("application/msexcel");
          ex.export(output);
          output.close();
		
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
	
	
	/*************************************************************** 商品分类 ***********************************************************/
	
	
	
	/**
	 * 获取所有的商品分类
	 * @param classify
	 * @return
	 */
	public List<MerchandiseClassify> getClassify(MerchandiseClassify classify) {
		return classifyMapper.selectByExample(classify);
	}

	/**
	 * 根据id删除数据
	 * @param id
	 * @param ids
	 * @return
	 */
	public Msg deleteById(Integer merchandiseId, String[] merchandiseIds) {
		
		if (merchandiseId == 0) {
			int a = merchandiseMapper.deleteByArray(merchandiseIds); 
			if (a > 0) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
			
		}else{
			int a = merchandiseMapper.deleteByPrimaryKey(merchandiseId);
			if (a == 1) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}

	public List<Merchandise> selectByStatus(Merchandise merchandise) {
		// TODO Auto-generated method stub
		return merchandiseMapper.selectByStatus(merchandise);
	}

	
}
