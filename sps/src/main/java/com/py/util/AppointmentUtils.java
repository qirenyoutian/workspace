package com.py.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.py.bean.SingleCar;

public class AppointmentUtils {
	public static Msg appointment(Date singleCarStartTime, Date singleCarEndTime, List<SingleCar> list) {
		//开始时间
		Calendar begin = Calendar.getInstance();
        begin.setTime(singleCarStartTime);
        //结束时间
        Calendar end = Calendar.getInstance();
        end.setTime(singleCarEndTime);
        
        Calendar date = Calendar.getInstance();
        StringBuffer str = new StringBuffer();
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        
		for (SingleCar singleCar : list) {
			date.setTime(singleCar.getSingleCarStartTime());//已被预约的开始时间
			if (date.after(begin) && date.before(end)) {//已被预约的开始时间在将要预约的时间内
				str.append(format.format(singleCar.getSingleCarStartTime())+"-"+format.format(end)+"已被预约");
				return Msg.fail().add("msg", str);
	        }else{
	        	date.setTime(singleCar.getSingleCarEndTime());//已被预约的结束时间
				if (!(date.after(begin) && date.before(end))) {//已被预约的结束时间在将要预约的时间内
					str.append(format.format(singleCarStartTime)+"-"+format.format(singleCar.getSingleCarEndTime())+"已被预约");
					return Msg.fail().add("msg", str);
		        }
	        }
		}
		return Msg.success();
	}
}
