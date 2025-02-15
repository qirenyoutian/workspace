package com.py.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.py.bean.BillingMethodHour;
import com.py.bean.BillingMethodMinute15;
import com.py.bean.BillingMethodRecord;
import com.py.bean.SingleCar;
import com.py.bean.TimeQuantum;

public class BillingMethodUtils {
	
	//时间段计费方式
	public static Double charging(BillingMethodRecord billingMethodRecord,SingleCar singleCar) throws ParseException {
		
		Integer startMonth = singleCar.getSingleCarStartTime().getMonth();							//停车开始时间(月)
		Integer startDay = singleCar.getSingleCarStartTime().getDay();								//停车开始时间(日)
		Integer startHour = singleCar.getSingleCarStartTime().getHours();							//停车开始时间(时)
		Integer startMinute = singleCar.getSingleCarStartTime().getMinutes();						//停车开始时间(分)
		
		Integer endMonth = singleCar.getSingleCarEndTime().getMonth();								//停车开始时间(月)
		Integer endDay = singleCar.getSingleCarEndTime().getDay();									//停车开始时间(日)
		Integer endHour = singleCar.getSingleCarEndTime().getHours();								//停车开始时间(时)
		Integer endMinute = singleCar.getSingleCarEndTime().getMinutes();							//停车开始时间(分)
		
		Integer quantumStartTime = 0;																//时间段开始时间
		Integer quantumEndTime = 0;																	//时间段结束时间
		
		Double startPrice = billingMethodRecord.getBillingMethodStartPrice(); 					//起步价
		Integer freeMinutes = billingMethodRecord.getBillingMethodFreeMinutes();				//免费分钟（分钟）
		Integer startMinutes = billingMethodRecord.getBillingMethodStartMinutes();				//起步分钟（分钟）
		Double minimumConsumption = billingMethodRecord.getBillingMethodMinimumConsumption();	//最低消费（元）,如果是0，则无限制
		Double maximumConsumption = billingMethodRecord.getBillingMethodMaximumConsumption(); 	//最高消费（元）如果是0，则无限
		//Integer timeoutThreshold = billingMethodRecord.getBillingMethodTimeoutThreshold(); 	//超时门限（分钟）
		
		Double rate = 0d;																		//费率
		long min = (singleCar.getSingleCarEndTime().getTime() - singleCar.getSingleCarStartTime().getTime())/(1000 * 60);						//停了多少分钟
		Double price = 0d;
		Long countMin = 0l;
		
		//该计费方式的时间段集
		List<TimeQuantum> timeQuantums = billingMethodRecord.getTimeQuantums();
		
		if(startMonth.equals(endMonth)  && startDay.equals(endDay)) {//同一天
			//停车时间大于免费时间
			if( freeMinutes <= min ) {
				for (TimeQuantum timeQuantum : timeQuantums) {
					quantumStartTime = timeQuantum.getTimeQuantumStartTime();		//开始时间所在的时间段的开始时间
					quantumEndTime = timeQuantum.getTimeQuantumEndTime();			//开始时间所在的时间段的结束时间
					rate = timeQuantum.getTimeQuantumRate();
					if(quantumStartTime >= startHour) {								//时间段开始时间大于停车开始时间
						if(endHour <= quantumEndTime) {								//停车结束时间小于等于时间段结束时间
							min = (quantumEndTime - quantumStartTime) * 60;
						}else {
							min = (endHour - quantumStartTime) * 60 + endMinute;
						}
						countMin += min;
						price += (min/60) * rate;
					}else {
						if(startHour < quantumEndTime) {
							if(endHour > quantumEndTime) {	
								min = (quantumEndTime - startHour) * 60 - startMinute;	//计算停车时间（该时间段的）
							}else {
								min = (endHour - startHour) * 60 - startMinute;			//计算停车时间（该时间段的）
							}
							countMin += min;
							price += (min/60) * rate;
						}
					}
				}
			}
			price = limit(price, minimumConsumption, startPrice, maximumConsumption);
		}else {
			long MM = 0;
			MM = (singleCar.getSingleCarEndTime().getTime() - singleCar.getSingleCarStartTime().getTime())/(1000 * 60 * 60 *24) - 1;//(天)
			
			double priceToDay = 0;//当天停车的费用
			for (TimeQuantum timeQuantum : timeQuantums) {
				quantumStartTime = timeQuantum.getTimeQuantumStartTime();		//开始时间所在的时间段的开始时间
				quantumEndTime = timeQuantum.getTimeQuantumEndTime();			//开始时间所在的时间段的结束时间
				rate = timeQuantum.getTimeQuantumRate();
				if(quantumStartTime >= startHour) {								//时间段开始时间大于停车开始时间
					min = (quantumEndTime - quantumStartTime) * 60;				//计算停车时间（该时间段的全部）
					countMin += min;
					priceToDay += (min/60) * rate;
				}else {
					if(startHour < quantumEndTime) {
						if(endHour > quantumEndTime) {	
							min = (quantumEndTime - startHour) * 60 - startMinute;	//计算停车时间（该时间段的）
						}else {
							min = (endHour - startHour) * 60 - startMinute;			//计算停车时间（该时间段的）
						}
						countMin += min;
						price += (min/60) * rate;
					}
				}
			}
			priceToDay = limit(priceToDay, minimumConsumption, startPrice, maximumConsumption);
			
			double priceMM = 0;//MM天停车的费用
			if(MM > 0) {
				for (TimeQuantum timeQuantum : timeQuantums) {
					quantumStartTime = timeQuantum.getTimeQuantumStartTime();	//开始时间所在的时间段的开始时间
					quantumEndTime = timeQuantum.getTimeQuantumEndTime();		//开始时间所在的时间段的结束时间
					rate = timeQuantum.getTimeQuantumRate();
					min = (quantumEndTime - quantumStartTime) * 60;				//计算停车时间（该时间段的全部）
					countMin += min;
					priceMM += (min/60) * rate;
				}
				priceMM = limit(priceMM, minimumConsumption, startPrice, maximumConsumption);
				priceMM *= MM;
			}
			
			double priceLastDay = 0;//最后一天停车的费用
			for (TimeQuantum timeQuantum : timeQuantums) {
				quantumStartTime = timeQuantum.getTimeQuantumStartTime();		//开始时间所在的时间段的开始时间
				quantumEndTime = timeQuantum.getTimeQuantumEndTime();			//开始时间所在的时间段的结束时间
				rate = timeQuantum.getTimeQuantumRate();
				if( quantumEndTime <= endHour) {
					min = (quantumEndTime - quantumStartTime) * 60;				//计算停车时间（该时间段的全部）
				}else {
					if(quantumStartTime < endHour) {
						min = (endHour - quantumStartTime) * 60 + endMinute;	//计算停车时间（该时间段的）
					}
				}
				countMin += min;
				priceLastDay += (min/60) * rate;
			}
			priceLastDay = limit(priceLastDay, minimumConsumption, startPrice, maximumConsumption);
			
			price = priceToDay + priceMM + priceLastDay;
		}
		
		if(countMin < startMinutes) {
			min = startMinutes;
			for (TimeQuantum timeQuantum : timeQuantums) {
				quantumStartTime = timeQuantum.getTimeQuantumStartTime();			//开始时间所在的时间段的开始时间
				quantumEndTime = timeQuantum.getTimeQuantumEndTime();				//开始时间所在的时间段的结束时间
				if(startHour >= quantumStartTime && startHour < quantumEndTime) {
					rate = timeQuantum.getTimeQuantumRate();
				}
			}
			price = (min/60) * rate;
			price = limit(price, minimumConsumption, startPrice, maximumConsumption);
		}
		
		price = limit(price, minimumConsumption, startPrice, maximumConsumption);
		
		return price;
	}
	//消费限制
	public static Double limit(Double price ,
			Double minimumConsumption ,
			Double startPrice,
			Double maximumConsumption) {
		if(minimumConsumption == 0) {
			if(price < startPrice) {//起步价
				price = startPrice;
			}
		}else {
			if(price < minimumConsumption) {//最低消费
				price = minimumConsumption;
			}
		}
		if(maximumConsumption != 0 && price > maximumConsumption) {//最高消费
			price = maximumConsumption;
		}
		return price;
	}
	/**
	 * 小时的计费方式
	 * @param singleCar
	 * @param billingMethodHour
	 * @return
	 */
	public static Double chargingHour(SingleCar singleCar,BillingMethodHour billingMethodHour) {
		Integer freeMinutes = billingMethodHour.getBillingMethodHourFreeMinutes();//免费分钟
		double price = billingMethodHour.getBillingMethodHourStartPrice();//起步价
		int priceDay = billingMethodHour.getBillingMethodHourDayPrice();//一天的最高消费
		Double addPrice = billingMethodHour.getBillingMethodHourAddPrice();//每增加一小时增加n元
		
		//总停车分钟
		long min = (singleCar.getSingleCarEndTime().getTime() - singleCar.getSingleCarStartTime().getTime())/(1000 * 60);//停了多少分钟
		if(min > freeMinutes) {
			if(min > 60 && min <= 60 * 24) {//一天内，大于一小时
				price += (Math.ceil((double)min/60) - 1) * addPrice;
				if(price > priceDay) {price = priceDay;}
			}else if(min > 60 * 24) {//大于一天
				int time = (int) (min/(60 * 24));//停车时间(天)
				if(min%(60 * 24) > 60) {//剩余的分钟
					price += Math.ceil((double)(min%(60 * 24))/60 - 1) * addPrice;
					if(price > priceDay) {price = priceDay;}
				}
				price += priceDay * time;//n天的停车费
			}
		}else {
			price = 0;
		}
		
		return price ;
	}
	public static void main(String[] args) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startTime = format.parse("2018-05-25 18:31:16");
		Date endTime = format.parse("2018-05-25 18:31:35");
		SingleCar singleCar = new SingleCar();
		singleCar.setSingleCarStartTime(startTime);
		singleCar.setSingleCarEndTime(endTime);
		Double price = chargingHour(singleCar,new BillingMethodHour());
		System.out.println(price);
	}
	/**
	 * 15分钟的计费方式
	 * @param singleCar
	 * @param billingMethodMinute15
	 * @return
	 * @throws ParseException
	 */
	public static Double chargingMinute15(SingleCar singleCar,BillingMethodMinute15 billingMethodMinute15) throws ParseException {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startDate = singleCar.getSingleCarStartTime();
		Date endDate = singleCar.getSingleCarEndTime();
		
		Calendar startNow = Calendar.getInstance();
		startNow.setTime(startDate);
		int startHour = startNow.get(Calendar.HOUR_OF_DAY);
		
		Calendar endNow = Calendar.getInstance();
		endNow.setTime(endDate);
		int endDay = endNow.get(Calendar.HOUR_OF_DAY);
		
		if(startHour > 22) {
			startDate = format.parse(formatYMD.format(startDate) + " 08:00:00");
			startDate = DateUtil.getDateAddDay(startDate, 1);
		}
		if(startHour < 8) {
			startDate = format.parse(formatYMD.format(startDate) + " 08:00:00");
		}
		
		if(endDay > 22) {
			endDate = format.parse(formatYMD.format(endDate) + " 22:00:00");
		}
		if(endDay < 8) {
			endDate = format.parse(formatYMD.format(endDate) + " 22:00:00");
			endDate = DateUtil.getDateAddDay(endDate, -1);
		}
		
		double price = 0;
		
		if(endDate.getTime() > startDate.getTime()) {
			
			Integer freeMinutes = billingMethodMinute15.getBillingMethodMinute15FreeMinutes();
			Double addPrice1 = billingMethodMinute15.getBillingMethodMinute15AddPrice1();//第一小时内（含1小时）每15分钟增加n元
			Double addPrice2 = billingMethodMinute15.getBillingMethodMinute15AddPrice2();//第二小时内（含2小时）每15分钟增加n元
			Double addPrice = billingMethodMinute15.getBillingMethodMinute15AddPrice();//第二小时后每15分钟增加n元
			Double dayPrice = billingMethodMinute15.getBillingMethodMinute15DayPrice();//每日最高费用
			
			long min = (endDate.getTime() - startDate.getTime())/(1000 * 60);//停了多少分钟
			if(min > freeMinutes) {
				int day = (int) (min/(60* 24));//停的天数
				int surplusMin = (int) (min%(60* 24));//不足一天的停车分钟
				
				if(surplusMin <= 60) {//一小时
					price = Math.ceil((double)surplusMin/15) * addPrice1;
				}else if(surplusMin > 60 && surplusMin <= 60 * 2) {//两小时
					price = (4 * addPrice1) + Math.ceil((double)(surplusMin -60)/15) * addPrice2;
				}else if(surplusMin > 60 * 2 && surplusMin <= 60 * 14) {//大于两小时小于十四小时
					price = (4 * addPrice1) + (4 * addPrice2) + Math.ceil((double)(surplusMin - 60 * 2)/15) * addPrice;
				}else if(surplusMin > 60 * 14 && surplusMin <= 60 * 24) {//大于十四小时小于一天    (这个条件在该方式下不会出现)
					price = (4 * addPrice1) + (4 * addPrice2) + Math.ceil((double)(surplusMin - 60 * 12)/15) * addPrice;
				}
				if(price > dayPrice){
					price = dayPrice;
				}
				price += day * ((4 * addPrice1) + (4 * addPrice2) + addPrice * 12);
			}
		}
		return price ;
	}
	
//	public static void main(String[] args) throws ParseException {  
//		double price = 0;
//		
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
//		
//		Date startDate = format.parse("2018-04-12 06:00:00");
//		Date endDate = format.parse("2018-04-12 07:00:00");
//		
//		Calendar startNow = Calendar.getInstance();
//		startNow.setTime(startDate);
//		int startHour = startNow.get(Calendar.HOUR_OF_DAY);
//		
//		Calendar endNow = Calendar.getInstance();
//		endNow.setTime(endDate);
//		int endDay = endNow.get(Calendar.HOUR_OF_DAY);
//		
//		if(startHour > 22) {
//			startDate = format.parse(formatYMD.format(startDate) + " 08:00:00");
//			startDate = DateUtil.getDateAddDay(startDate, 1);
//		}
//		if(startHour < 8) {
//			startDate = format.parse(formatYMD.format(startDate) + " 08:00:00");
//		}
//		
//		if(endDay > 22) {
//			endDate = format.parse(formatYMD.format(endDate) + " 22:00:00");
//		}
//		if(endDay < 8) {
//			endDate = format.parse(formatYMD.format(endDate) + " 22:00:00");
//			endDate = DateUtil.getDateAddDay(endDate, -1);
//		}
//		
//		if(endDate.getTime() > startDate.getTime()) {
//			long min = (endDate.getTime() - startDate.getTime())/(1000 * 60);//停了多少分钟
//			int day = (int) (min/(60* 24));
//			int surplusMin = (int) (min%(60* 24));
//			if(surplusMin <= 60) {//一小时
//				price = Math.ceil((double)surplusMin/15) * 1;
//			}else if(surplusMin > 60 && surplusMin <= 60 * 2) {//两小时
//				price = 4 + Math.ceil((double)(surplusMin -60)/15) * 2;
//			}else if(surplusMin > 60 * 2 && surplusMin <= 60 * 14) {
//				price = 4 + 8 + Math.ceil((double)(surplusMin - 60 * 2)/15) * 2.5;
//			}else if(surplusMin > 60 * 14 && surplusMin <= 60 * 24) {
//				price = 4 + 8 + Math.ceil((double)(surplusMin - 60 * 12)/15) * 2.5;
//			}
//			if(price > 60) {
//				price = 60;
//			}
//			price += day * 60;
//		}
//		System.out.println(price);
//    } 
	
}
