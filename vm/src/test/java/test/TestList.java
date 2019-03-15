package test;

import java.util.ArrayList;
import java.util.List;

public class TestList {
	
	public static int id = 0 ;
	
	
	public static void main(String[] args) {
		
		List<String> list = new ArrayList<String>();
		list.add("asd");
		
		for (String string : list) {
			System.out.println(string);
		}
		
		
	}
	
	
	
	

}
