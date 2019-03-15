package com.py.bean;

import java.util.Date;

public class CarportOrder {
	
	private Integer id;//订单id
	private String parking_lot_name;//停车场名字
	private String parking_lot_number;//停车场编号
	private Date single_car_start_time;//预约开始时间
	private Date single_car_end_time;//预约结束时间
	private Double parking_lot_charge;//计费 （*元/h）
	private String parking_lot_location_attr;//地址
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParking_lot_name() {
		return parking_lot_name;
	}
	public void setParking_lot_name(String parking_lot_name) {
		this.parking_lot_name = parking_lot_name;
	}
	public String getParking_lot_number() {
		return parking_lot_number;
	}
	public void setParking_lot_number(String parking_lot_number) {
		this.parking_lot_number = parking_lot_number;
	}
	public Date getSingle_car_start_time() {
		return single_car_start_time;
	}
	public void setSingle_car_start_time(Date single_car_start_time) {
		this.single_car_start_time = single_car_start_time;
	}
	public Date getSingle_car_end_time() {
		return single_car_end_time;
	}
	public void setSingle_car_end_time(Date single_car_end_time) {
		this.single_car_end_time = single_car_end_time;
	}
	public Double getParking_lot_charge() {
		return parking_lot_charge;
	}
	public void setParking_lot_charge(Double parking_lot_charge) {
		this.parking_lot_charge = parking_lot_charge;
	}
	public String getParking_lot_location_attr() {
		return parking_lot_location_attr;
	}
	public void setParking_lot_location_attr(String parking_lot_location_attr) {
		this.parking_lot_location_attr = parking_lot_location_attr;
	}
	public CarportOrder(Integer id, String parking_lot_name, String parking_lot_number, Date single_car_start_time,
			Date single_car_end_time, Double parking_lot_charge, String parking_lot_location_attr) {
		super();
		this.id = id;
		this.parking_lot_name = parking_lot_name;
		this.parking_lot_number = parking_lot_number;
		this.single_car_start_time = single_car_start_time;
		this.single_car_end_time = single_car_end_time;
		this.parking_lot_charge = parking_lot_charge;
		this.parking_lot_location_attr = parking_lot_location_attr;
	}
	public CarportOrder() {
		super();
	}
	
}
