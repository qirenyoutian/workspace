package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.CommercialTenantReport;
import com.py.bean.MerchandiseReport;
import com.py.bean.PointReport;
import com.py.dao.OrderMapper;
import com.py.dao.PointMapper;
import com.py.dao.SingleMapper;

@Service
public class DataService {
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private SingleMapper singleMapper;
	
	
	
	
	
	/**
	 * 点位报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<PointReport> pointReport(String startTime, String endTime) {
		
		List<PointReport> pointReports = orderMapper.getPointReport(startTime,endTime);
		
		return pointReports;
	}
	
	/**
	 * 商户报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<CommercialTenantReport> getCommercialTenantReport(String startTime, String endTime) {
		List<CommercialTenantReport> commercialTenantReports = orderMapper.getCommercialTenantReport(startTime,endTime);
		return commercialTenantReports;
	}

	/**
	 * 商品报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<MerchandiseReport> getMerchandiseReport(String startTime, String endTime) {
		// TODO Auto-generated method stub
		return orderMapper.getMerchandiseReport(startTime,endTime);
	}
	
	
	/******************************************************** 外来订单 **************************************************************/
	
	/**
	 * 点位报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<PointReport> pointReportSingle(String startTime, String endTime) {
		
		List<PointReport> pointReports = singleMapper.getPointReport(startTime,endTime);
		
		return pointReports;
	}
	
	/**
	 * 商户报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<CommercialTenantReport> getCommercialTenantReportSingle(String startTime, String endTime) {
		List<CommercialTenantReport> commercialTenantReports = singleMapper.getCommercialTenantReport(startTime,endTime);
		return commercialTenantReports;
	}
	
	/**
	 * 商品报表
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List<MerchandiseReport> getMerchandiseReportSingle(String startTime, String endTime) {
		// TODO Auto-generated method stub
		return singleMapper.getMerchandiseReport(startTime,endTime);
	}
	
	

}
