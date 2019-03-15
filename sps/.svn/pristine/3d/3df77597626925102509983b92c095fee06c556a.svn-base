package com.py.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Geography;
import com.py.bean.IncomeCount;
import com.py.bean.Route;
import com.py.bean.RouteAndRecord;
import com.py.bean.RouteInvoice;
import com.py.bean.RouteRecord;
import com.py.dao.RouteMapper;

@Service
public class RouteService {
	@Autowired
	RouteMapper routeMapper;
	public int deleteByPrimaryKey(Integer RouteId) {
		return routeMapper.deleteByPrimaryKey(RouteId);
	}

	public int insert(Route record) {
		return routeMapper.insert(record);
	}

	public int insertSelective(Route record) {
		return routeMapper.insertSelective(record);
	}

	public Route selectByPrimary(Route record) {
		return routeMapper.selectByPrimary(record);
	}
    
	public List<Route> selectByExample(Route record) {
		return routeMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(Route record) {
		return routeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Route record) {
		return routeMapper.updateByPrimaryKey(record);
	}

	public Route selectByPrimaryKey(Integer RouteId) {
		return routeMapper.selectByPrimaryKey(RouteId);
	}

	public List<RouteAndRecord> selectByRange(Geography geography) {
		return routeMapper.selectByRange(geography);
	}
	
	public List<RouteAndRecord> queryAllTradingRecordAndRoute(){
		return routeMapper.queryAllTradingRecordAndRoute();
	}

	public List<RouteRecord> queryAllRouteRecord(Route route) {
		return routeMapper.queryAllRouteRecord(route);
	}
	
	public RouteRecord selectRouteRecord(Route route) {
		return routeMapper.selectRouteRecord(route);
	}

	public List<RouteAndRecord> queryThreeMonthTradingRecordAndRoute() {
		return routeMapper.queryThreeMonthTradingRecordAndRoute();
	}

	public List<IncomeCount> selectFrequencyForRoute(String routeName) {
		return routeMapper.selectFrequencyForRoute(routeName);
	}

	public List<RouteInvoice> routeInvoice(Integer routeId) {
		return routeMapper.routeInvoice(routeId);
	}

	public List<RouteInvoice> routeSingleCar(Map<String, Object> map) {
		return routeMapper.routeSingleCar(map);
	}

}
