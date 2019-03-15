package com.py.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 关于判断字符的操作
 * @author Administrator
 *
 */
public class BooleanString {
	/**
	 * 判断一个字符串是否含有英文
	 */
	 public static boolean isEnglish(String str){
		 boolean bool = str.matches("[a-zA-Z]+");
		 if(bool){
			 //含有英文
			 return true;
		 }else{
			 //不含英文
			 return false;
		 }
	 }
	 /**
	  * 判断一个字符串是否含有中文
	  */
	 public static boolean isChinese(String str){
	     String regEx = "[\\u4e00-\\u9fa5]+";
	     Pattern p = Pattern.compile(regEx);
	     Matcher m = p.matcher(str);
	     if(m.find()){
	    	 //含有汉字
	    	 return true;
	     }else{
	    	 //不含汉字
	    	 return false;
	     }
	 }
	 /**
     * 判断是否含有特殊字符
     */
    public static boolean isSpecialChar(String str) {
        String regEx = "[ _`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]|\n|\r|\t";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        if(m.find()){
        	//包含
	    	return true;
        }else{
        	//不包含
        	return false;
        }
    }
    /**
     * 判断是否含有数字
     * @param company
     * @return
     */
    public static boolean isContainNumber(String str) {

        Pattern p = Pattern.compile("[0-9]");
        Matcher m = p.matcher(str);
        if (m.find()) {
            return true;
        }
        return false;
    }
    /**
     * 检查是否为数字
     * @param str
     * @return
     */
    public static boolean isNumber(String str){
       for (int i = str.length();--i>=0;){  
           if (!Character.isDigit(str.charAt(i))){
               return false;
           }
       }
       return true;
    }
    
    /**
     * 判断邮箱
     */
    public static boolean checkEmail(String email) {
        boolean flag = false;
        try {
            String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
            Pattern regex = Pattern.compile(check);
            Matcher matcher = regex.matcher(email);
            flag = matcher.matches();
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
    
   
    /**
     * 验证手机号码，11位数字，1开通，第二位数必须是3456789这些数字之一 
     * @param mobileNumber
     * @return
     */
    public static boolean checkMobileNumber(String mobileNumber) {
       boolean flag = false;
       try {
           Pattern regex = Pattern.compile("^1[345789]\\d{9}$");
           Matcher matcher = regex.matcher(mobileNumber);
           flag = matcher.matches();
       } catch (Exception e) {
           e.printStackTrace();
           flag = false;

       }
       return flag;
   }
   /**
    * 验证身份证号码，11位数字，1开通，第二位数必须是3456789这些数字之一 
    * @param mobileNumber
    * @return
    */
  public static boolean checkIdentityNumber(String mobileNumber) {
      boolean flag = false;
      try {
          Pattern regex = Pattern.compile("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])");
          Matcher matcher = regex.matcher(mobileNumber);
          flag = matcher.matches();
      } catch (Exception e) {
          e.printStackTrace();
          flag = false;

      }
      return flag;
  }
  /**
   * 验证手机号格式是否正确
   */
  public static boolean checkPhone(String phone) {  
	  boolean flag = false;
      if(!phone.matches("^1[3|4|5|7|8][0-9]\\d{4,8}$")){  
          flag = false;
      }else{  
    	  flag = true;
      }  
      return flag;  
  }  
  /**
   * 验证金额格式是否正确
   */
  public static boolean isMoneyNumber(String str){   
      java.util.regex.Pattern pattern=java.util.regex.Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$"); // 判断小数点后2位的数字的正则表达式  
      java.util.regex.Matcher match=pattern.matcher(str);   
      if(match.matches()==false){   
         return false;   
      }
      else{   
         return true;   
      }   
  }  
}
