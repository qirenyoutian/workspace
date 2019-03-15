package test;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.util.Arrays;

public class TestSocket {
	
	/*public static void main(String[] args) {
		String str = "89 86 02 B1 03 17 00 11 71 84 03 00001388 fe7f";
		 String[] strings = str.replaceAll(" ",",").split(",");
	     byte b[] = new byte[strings.length + 1];
	     for(int i = 0 ;i<strings.length;i++){
	        // System.out.println("i == "+i+"的时候:"+strings[i]);
	         if (i<11){
	             b[i] = (byte) Long.parseLong(strings[i] ,16);
	         }else if (i == 11){
	             String string = strings[i];
	             String byteStr = "";
	             for(int j = 0; j< string.length(); j+=2){
	                 if(j == 6){
	                     byteStr += string.substring(j, string.length());
	                 }else{
	                     byteStr += string.substring(j, j+2);
	                 }
	             }
	             byte[] bytes = byteStr.getBytes();
	             try {
					String srt2 = new String(bytes,"UTF-8");
					
					System.out.println(srt2);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	             
	            b[i] = (byte) Long.parseLong(byteStr ,16);
	             byte a = (byte) Long.parseLong(byteStr ,16);
	             System.out.println(a);
	             
	           
	             
	             
	             
	         }else{
	             b[i] = (byte) Long.parseLong(strings[i].substring(0,2) ,16);
	             b[i+1] = (byte) Long.parseLong(strings[i].substring(2) ,16);
	            // System.out.println(b);
	         }
	         
	     }
	     System.out.println(Arrays.toString(b));
	     
	}*/
	
	/*
	 public static final String IP_ADDR = "192.168.1.110";//服务器地址   
	    public static final int PORT = 9504;//服务器端口号    
	      
	    public static void main(String[] args) {    
	        System.out.println("客户端启动...");    
	        System.out.println("当接收到服务器端字符为 \"OK\" 的时候, 客户端将终止\n");   
	        while (true) {    
	            Socket socket = null;  
	            try {  
	                //创建一个流套接字并将其连接到指定主机上的指定端口号  
	                socket = new Socket(IP_ADDR, PORT);    
	                    
	                //读取服务器端数据    
	                DataInputStream input = new DataInputStream(socket.getInputStream());    
	                //向服务器端发送数据    
	                DataOutputStream out = new DataOutputStream(socket.getOutputStream());    
	                System.out.print("请输入: \t");    
	                String str = new BufferedReader(new InputStreamReader(System.in)).readLine();    
	                out.writeUTF(str);    
	                    
	                String ret = input.readUTF();     
	                System.out.println("服务器端返回过来的是: " + ret);    
	                // 如接收到 "OK" 则断开连接    
	                if ("aa".equals(ret)) {    
	                    System.out.println("客户端将关闭连接");    
	                    Thread.sleep(500);    
	                    break;    
	                }    
	                  
	                out.close();  
	                input.close();  
	            } catch (Exception e) {  
	                System.out.println("客户端异常:" + e.getMessage());   
	            } finally {  
	                if (socket != null) {  
	                    try {  
	                        socket.close();  
	                    } catch (IOException e) {  
	                        socket = null;   
	                        System.out.println("客户端 finally 异常:" + e.getMessage());   
	                    }  
	                }  
	            }  
	        }    
	    }    */
	
	
	
	public static void main(String[] args) {
		
		System.out.println(TestList.id);
		
	}

}
