package com.py.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Geography;
import com.py.bean.IncomeCount;
import com.py.bean.Route;
import com.py.bean.RouteAndRecord;
import com.py.bean.RouteInvoice;
import com.py.bean.RouteRecord;

public interface RouteMapper {
    int deleteByPrimaryKey(Integer routeId);

    int insert(Route record);

    int insertSelective(Route record);

    Route selectByPrimaryKey(Integer routeId);

    int updateByPrimaryKeySelective(Route record);

    int updateByPrimaryKey(Route record);

	Route selectByPrimary(Route record);

	List<Route> selectByExample(Route record);

	List<RouteAndRecord> selectByRange(Geography geography);

	List<RouteAndRecord> queryAllTradingRecordAndRoute();

	List<RouteRecord> queryAllRouteRecord(Route route);

	RouteRecord selectRouteRecord(Route route);

	List<RouteAndRecord> queryThreeMonthTradingRecordAndRoute();

	List<IncomeCount> selectFrequencyForRoute(@Param("routeName")String routeName);

	List<RouteInvoice> routeInvoice(@Param("routeId")Integer routeId);

	List<RouteInvoice> routeSingleCar(@Param("map")Map<String, Object> map);
}