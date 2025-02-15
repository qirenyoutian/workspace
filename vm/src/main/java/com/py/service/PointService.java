package com.py.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Area;
import com.py.bean.ChannelPoint;
import com.py.bean.Point;
import com.py.dao.AreaMapper;
import com.py.dao.ChannelPointMapper;
import com.py.dao.PointMapper;
import com.py.util.Msg;

@Service
public class PointService {

	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private ChannelPointMapper channelPointMapper;
	@Autowired
	AreaMapper areaMapper;
	
	
	

	public int deleteByPrimaryKey(Integer pointId) {
		return pointMapper.deleteByPrimaryKey(pointId);
	}

	public int insert(Point record) {
		return pointMapper.insert(record);
	}

	public int insertSelective(Point record) {
		
		int a = pointMapper.insertSelective(record);
		return a;
	}

	public int updateByPrimaryKeySelective(Point record) {
		return pointMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Point record) {
		return pointMapper.updateByPrimaryKey(record);
	}

	public Point selectByPrimary(Point point) {
		return pointMapper.selectByPrimary(point);
	}
	/**
	 * ByExample
	 * @param point
	 * @return
	 */
	public List<Point> selectByExample(Point point) {
		List<Point> points = pointMapper.selectByExample(point);
		for (Point p : points) {
			List<Area> areas = p.getAreas();
			areas.add(areaMapper.selectByPrimaryKey(p.getPointProvince()));
			areas.add(areaMapper.selectByPrimaryKey(p.getPointCity()));
			areas.add(areaMapper.selectByPrimaryKey(p.getPointDistrict()));
		}
		return points;
	}

	public List<Point> selectByTime(String startTime, String endTime) {
		return pointMapper.selectByTime(startTime,endTime);
	}
	
	/*public List<Point> selectByExampleInEquipment(Equipment equipment) {
		return null;
	}*/
	
	public Point selectByPrimaryKey(Integer id) {
		return pointMapper.selectByPrimaryKey(id);
	}

	public Msg updatepoint(HttpServletRequest request) {
		String pointId = request.getParameter("pointId");
		String pointName = request.getParameter("pointName");
		String pointProvince = request.getParameter("pointProvince");
		String pointCity = request.getParameter("pointCity");
		String pointDistrict = request.getParameter("pointDistrict");
		String pointAddress = request.getParameter("pointAddress");
		Point point = new Point();
		point.setPointId(Integer.parseInt(pointId));
		point.setPointName(pointName);
		point.setPointProvince(Integer.parseInt(pointProvince));
		point.setPointCity(Integer.parseInt(pointCity));
		point.setPointDistrict(Integer.parseInt(pointDistrict));
		point.setPointAddress(pointAddress);
		pointMapper.updateByPrimaryKeySelective(point);
		return Msg.success();
	}

	/**
	 * 批量删除
	 * @param ids
	 * @return 
	 */
	public int deleteByPointIds(Integer[] ids) {
		return pointMapper.deleteByPointIds(ids);
	}
	/**
	 * 添加点位
	 * @param point
	 * @param channelId
	 * @return
	 */
	public Msg insertSelective(HttpServletRequest request) {
		
		String pointName = request.getParameter("pointName");
		String pointProvince = request.getParameter("pointProvince");
		String pointCity = request.getParameter("pointCity");
		String pointDistrict = request.getParameter("pointDistrict");
		String pointAddress = request.getParameter("pointAddress");
		String ChannelId = request.getParameter("ChannelId");
		
		Point point = new Point();
		point.setPointName(pointName);
		point.setPointProvince(Integer.parseInt(pointProvince));
		point.setPointCity(Integer.parseInt(pointCity));
		point.setPointDistrict(Integer.parseInt(pointDistrict));
		point.setPointAddress(pointAddress);
		
		int a = pointMapper.insertSelective(point);
		
		if (a == 1) {
			ChannelPoint channelPoint = new ChannelPoint();
			channelPoint.setChannelPointChannelId(Integer.parseInt(ChannelId));
			channelPoint.setChannelPointPointId(point.getPointId());
			a = channelPointMapper.insertSelective(channelPoint);
			if (a == 1) {
				return Msg.success();
			}else{
				return Msg.fail().add("msg", "渠道添加失败！");
			}
		}else{
			return Msg.fail().add("msg", "未知错误！");
		}
	}

	/**
	 * getPoint
	 * @param content
	 * @return
	 */
	public List<Point> getPoint(String content){
			
			Point point = new Point();
			if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
				point.setPointName(content);
			}
			
			List<Point> pp = pointMapper.selectByExample(point);
			
			return pp;
		}
	
}
