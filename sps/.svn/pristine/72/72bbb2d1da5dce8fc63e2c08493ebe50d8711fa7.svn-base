package com.py.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.SingleCar;
import com.py.bean.SingleCarDetailsRecord;
import com.py.bean.SingleCarInvoice;
import com.py.bean.SingleCarRecord;
import com.py.dao.SingleCarMapper;

@Service
public class SingleCarService {
	@Autowired
	SingleCarMapper singleCarMapper;
	public int deleteByPrimaryKey(Integer singleCarId) {
		return singleCarMapper.deleteByPrimaryKey(singleCarId);
	}

	public int insert(SingleCar record) {
		return singleCarMapper.insert(record);
	}

	public int insertSelective(SingleCar record) {
		return singleCarMapper.insertSelective(record);
	}

	public SingleCar selectByPrimary(SingleCar record) {
		return singleCarMapper.selectByPrimary(record);
	}
    
	public List<SingleCar> selectByExample(SingleCar record) {
		return singleCarMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(SingleCar record) {
		return singleCarMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(SingleCar record) {
		return singleCarMapper.updateByPrimaryKey(record);
	}

	public SingleCar selectByPrimaryKey(Integer singleCarId) {
		return singleCarMapper.selectByPrimaryKey(singleCarId);
	}
	
	public List<SingleCar> selectByLicensePlate(List<String> licensePlates){
		return singleCarMapper.selectByLicensePlate(licensePlates);
	}
	public List<SingleCar> selectAllRoute(){
		return singleCarMapper.selectAllRoute();
	}

	public SingleCar selectByPrimaryTop1(SingleCar singleCar) {
		return singleCarMapper.selectByPrimaryTop1(singleCar);
	}

	public List<SingleCarInvoice> selectByLicensePlateByMap(Map<String, Object> map) {
		return singleCarMapper.selectByLicensePlateByMap(map);
	}

	public List<SingleCar> selectByCamareIp(String camareIp) {
		return singleCarMapper.selectByCamareIp(camareIp);
	}

	public List<SingleCarRecord> selectByExampleRecord(SingleCar record) {
		return singleCarMapper.selectByExampleRecord(record);
	}

	public List<SingleCarDetailsRecord> selectSingleCarRecordsByLicensePlate(List<String> licensePlates) {
		return singleCarMapper.selectSingleCarRecordsByLicensePlate(licensePlates);
	}

	public List<SingleCarDetailsRecord> selectByExampleSingleCarDetailsRecordRecord(SingleCar singleCar) {
		return singleCarMapper.selectByExampleSingleCarDetailsRecordRecord(singleCar);
	}

	public List<SingleCarDetailsRecord> selectByExampleRecordTop20(SingleCar singlecar) {
		return singleCarMapper.selectByExampleRecordTop20(singlecar);
	}

	public List<SingleCarDetailsRecord> selectByExampleSingleCarDetailsRecordRecordByNewFive(SingleCar singleCar) {
		// TODO Auto-generated method stub
		return singleCarMapper.selectByExampleSingleCarDetailsRecordRecordByNewFive(singleCar);
	}
	
}
