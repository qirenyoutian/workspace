package test;

import com.py.util.MD5;

public class TestMd5 {
		
	
	
	public static void main(String[] args) {
		
		String pwd = "admin";
		
		String aa = MD5.string2MD5(pwd);
		System.out.println(aa);
		
		
		
		//System.out.println(MD5Util.MD5Encode(pwd, pwd));
		
		
		
	}
	
	
}
