package com.py.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.py.bean.SingleCar;
import com.py.bean.SingleCarDetailsRecord;
import com.py.bean.SingleCarInvoice;
import com.py.bean.SingleCarRecord;

public interface SingleCarMapper {
    int deleteByPrimaryKey(Integer singleCarId);

    int insert(SingleCar record);

    int insertSelective(SingleCar record);

    SingleCar selectByPrimaryKey(Integer singleCarId);

    int updateByPrimaryKeySelective(SingleCar record);

    int updateByPrimaryKey(SingleCar record);

	SingleCar selectByPrimary(SingleCar record);

	List<SingleCar> selectByExample(SingleCar record);

	List<SingleCar> selectByLicensePlate(@Param("licensePlates")List<String> licensePlates);

	List<SingleCar> selectAllRoute();

	SingleCar selectByPrimaryTop1(SingleCar singleCar);

	List<SingleCarInvoice> selectByLicensePlateByMap(@Param("map")Map<String, Object> map);

	List<SingleCar> selectByCamareIp(@Param("cameraIp")String camareIp);

	List<SingleCarRecord> selectByExampleRecord(SingleCar record);

	List<SingleCarDetailsRecord> selectSingleCarRecordsByLicensePlate(@Param("licensePlates")List<String> licensePlates);

	List<SingleCarDetailsRecord> selectByExampleSingleCarDetailsRecordRecord(SingleCar singleCar);

	List<SingleCarDetailsRecord> selectByExampleRecordTop20(SingleCar singlecar);

	List<SingleCarDetailsRecord> selectByExampleSingleCarDetailsRecordRecordByNewFive(SingleCar singleCar);
}