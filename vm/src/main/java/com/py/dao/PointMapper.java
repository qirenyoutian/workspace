package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Equipment;
import com.py.bean.Point;

public interface PointMapper {
    int deleteByPrimaryKey(Integer pointId);

    int insert(Point record);

    int insertSelective(Point record);

    Point selectByPrimaryKey(Integer pointId);

    int updateByPrimaryKeySelective(Point record);

    int updateByPrimaryKey(Point record);

	List<Point> selectByExampleInEquipment(Equipment equipment);

	List<Point> selectByExample(Point point);

	List<Point> selectByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	Point selectByPrimary(Point point);

	int deleteByPointIds(@Param("ids")Integer[] ids);

}