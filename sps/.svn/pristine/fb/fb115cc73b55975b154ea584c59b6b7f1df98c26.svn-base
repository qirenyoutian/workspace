package com.py.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Invoice;
import com.py.bean.SingleCar;
import com.py.bean.User;
import com.py.bean.UserInvoice;
import com.py.bean.UserRecord;

public interface UserMapper {
    int deleteByPrimaryKey(@Param("userId")Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByPrimary(User record);

	List<User> selectByExample(User record);

	List<UserRecord> queryAllTradingRecordAndUser();

	List<UserRecord> selectAllIncomeByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	List<UserRecord> selectAllSingleCarByRoute(SingleCar singleCar);

	List<UserInvoice> selectExsampleWithInvoice(User user);

	List<UserInvoice> selectAllInvoiceByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

	List<UserInvoice> selectAllInvoiceByType(Invoice invoice);

	int updateForStatusById(@Param("invoiceId")Integer invoiceId, @Param("status")Integer status);

	List<User> selectByTimeQuantum(@Param("map")Map<String, String> map);

	List<User> selectByExampleTop10(User user);

	int countUser();
}