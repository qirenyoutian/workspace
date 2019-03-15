package com.py.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * 关于时间的方法
 * @author Administrator
 *
 */
public class OfTime {
	/**
	 * 获取当前系统时间（yyyy-MM-dd HH:mm:ss）格式
	 * @return
	 */
	public static String getLongTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
	}
	/**
	 * 获取当前系统时间（yyyyMMddHHmmss）格式
	 * @return
	 */
	public static String getLongTimeWu(){
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
		return df.format(new Date());
	}
	/**
	 * 获取当前系统时间（yyyy-MM-dd ）格式
	 */
	public static String getShortTime(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		return df.format(new Date());
	}
	
	/**
	 * 获取当前系统时间（yyyy-M-d ）格式
	 */
	public static String getShortTime2(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-M-d");//设置日期格式
		return df.format(new Date());
	}
	
	/**
	 * 时间增加
	 * @param time 时间
	 * @param type 年，月，日，周
	 * @param num 要增加的数
	 * @return
	 * @throws ParseException
	 */
	public static String increaseTheTime(String time,String type,int num) throws ParseException{
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse(time);
	    Calendar calendar = new GregorianCalendar(); 
	    calendar.setTime(date); 
	    switch (type) {
		case "year":
			calendar.add(calendar.YEAR, num);//把日期往后增加一年.整数往后推,负数往前移动
			break;
		case "month":
			calendar.add(calendar.MONTH, num);//把日期往后增加一个月.整数往后推,负数往前移动
			break;
		case "date":
			calendar.add(calendar.DATE,num);//把日期往后增加一天.整数往后推,负数往前移动 
			break;
		case "week":
			calendar.add(calendar.WEEK_OF_MONTH, num);//这个时间就是日期往后推一天的结果 
			break;
		default:
			break;
		}
	    date=calendar.getTime();   
	    String dateStr=sdf.format(date);
		return dateStr;
	}
	/**
	 * 比较时间大小
	 * @param time1 时间1
	 * @param time2 时间2
	 * @return 时间1大于时间2 返回：1 时间1小于时间2 返回：-1
	 */
	public static int comparisonTime(String time1, String time2){
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date dt1 = df.parse(time1);
            Date dt2 = df.parse(time2);
            if (dt1.getTime() > dt2.getTime()) {
                return 1;
            } else if (dt1.getTime() < dt2.getTime()) {
                return -1;
            } else {
                return 0;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return 0;
	}
	
	/**
	 * 按照参数format的格式，日期转字符串
	 * @param date
	 * @param format
	 * @return
	 */
	public static String date2Str(Date date,String format){
		if(date!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return sdf.format(date);
		}else{
			return "";
		}
	}
	/**
	 * 计算天数时间差（已经过了：-X，还没有过：X）
	 * @param time 要计算的时间
	 * @return
	 * @throws ParseException 
	 */
	public static int timeDifference(String time) throws ParseException{
		String a = "2018-1-1 14:10:42";
		Date a1 = new SimpleDateFormat("yyyy-MM-dd").parse(a);
		Date b1 = new SimpleDateFormat("yyyy-MM-dd").parse(OfTime.getLongTime());
		//获取相减后天数
		int day = (int) ((a1.getTime()-b1.getTime())/(24*60*60*1000));
		return day;
	}
	/** 
     * 获取当月的 天数 
     */  
    public static int getCurrentMonthDay() {  

        Calendar a = Calendar.getInstance();  
        a.set(Calendar.DATE, 1);  
        a.roll(Calendar.DATE, -1);  
        int maxDate = a.get(Calendar.DATE);  
        return maxDate;  
    }  

    /** 
     * 根据年 月 获取对应的月份 天数 
     */  
    public static int getDaysByYearMonth(int year, int month) {  

        Calendar a = Calendar.getInstance();  
        a.set(Calendar.YEAR, year);  
        a.set(Calendar.MONTH, month - 1);  
        a.set(Calendar.DATE, 1);  
        a.roll(Calendar.DATE, -1);  
        int maxDate = a.get(Calendar.DATE);  
        return maxDate;  
    }  

    /** 
     * 根据日期 找到对应日期的 星期 
     */  
    public static String getDayOfWeekByDate(String date) {  
        String dayOfweek = "-1";  
        try {  
            SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");  
            Date myDate = myFormatter.parse(date);  
            SimpleDateFormat formatter = new SimpleDateFormat("E");  
            String str = formatter.format(myDate);  
            dayOfweek = str;  

        } catch (Exception e) {  
            System.out.println("错误!");  
        }  
        return dayOfweek;  
    }  
    
    /**
     * 
     * 通过时间秒毫秒数判断两个时间的间隔
     * @param date1
     * @param date2
     * @return
     * @throws ParseException 
     */
    public static int differentDaysByMillisecond(String time1,String time2) throws ParseException
    {
    	 DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	 Date date1 = df.parse(time1);
         Date date2 = df.parse(time2);
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
        return days;
    }
    
    
    
    
    //返回当前年月日  
    public static String getNowDate()  
    {  
        Date date = new Date();  
        String nowDate = new SimpleDateFormat("yyyy年MM月dd日").format(date);  
        return nowDate;  
    }  
  
    //返回当前年份  
    public static int getYear()  
    {  
        Date date = new Date();  
        String year = new SimpleDateFormat("yyyy").format(date);  
        return Integer.parseInt(year);  
    }  
  
    //返回当前月份  
    public static int getMonth()  
    {  
        Date date = new Date();  
        String month = new SimpleDateFormat("MM").format(date);  
        return Integer.parseInt(month);  
    }  
  
    //判断闰年  
    public static boolean isLeap(int year)  
    {  
        if (((year % 100 == 0) && year % 400 == 0) || ((year % 100 != 0) && year % 4 == 0))  
            return true;  
        else  
            return false;  
    }  
  
    //返回当月天数  
    public static int getDays(int year, int month)  
    {  
        int days;  
        int FebDay = 28;  
        if (isLeap(year))  
            FebDay = 29;  
        switch (month)  
        {  
            case 1:  
            case 3:  
            case 5:  
            case 7:  
            case 8:  
            case 10:  
            case 12:  
                days = 31;  
                break;  
            case 4:  
            case 6:  
            case 9:  
            case 11:  
                days = 30;  
                break;  
            case 2:  
                days = FebDay;  
                break;  
            default:  
                days = 0;  
                break;  
        }  
        return days;  
    }  
  
    //返回当月星期天数  
    public  static int getSundays(int year, int month)  
    {  
        int sundays = 0;  
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");  
        Calendar setDate = Calendar.getInstance();  
        //从第一天开始  
        int day;  
        for (day = 1; day <= getDays(year, month); day++)  
        {  
            setDate.set(Calendar.DATE, day);  
            String str = sdf.format(setDate.getTime());  
            if (str.equals("星期日"))  
            {  
                sundays++;  
            }  
        }  
        return sundays;  
    }  
  
    public static void main(String[] args) throws ParseException  
    {  
       OfTime du = new OfTime();
       /* System.out.println("今天日期是：" + du.getNowDate());  
        System.out.println("本月有" + du.getDays(du.getYear(), du.getMonth()) + "天");  
        System.out.println("本月有" + du.getSundays(du.getYear(), du.getMonth()) + "个星期天");  
        boolean a =  du.isLeap(2019);
        
        int b = du.comparisonTime("2018-01-09 15:39:36","2018-01-09 15:39:36");
        
        String string = du.increaseTheTime("2018-01-09 15:39:36", "year", 2);
        System.out.println(string);
        System.out.println(b);
        System.out.println(a);
        */
        
        int abc = du.comparisonTime("2018-01-08 10:34:30","2018-01-08 10:34:30");
        System.out.println(abc);
        
    }  
}  
    

