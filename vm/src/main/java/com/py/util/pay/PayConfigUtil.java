package com.py.util.pay;

import javax.servlet.http.HttpServletRequest;

public class PayConfigUtil {

	public static final String APP_ID = "";//微信开发平台应用ID(公众号ID)
    public static final String MCH_ID = "";//商户号(商户号ID)
    public static final String API_KEY = "";//API key(商户号里面的)
    public static final String CREATE_IP = "";//发起支付的ip
    public static final String NOTIFY_URL = "";//回调地址
    public static final String UFDODER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";//微信统一下单接口
    public static final String APP_SECRET = "";//应用对应的凭证(在公众号里面)
    
    //获取ip
    public static String getIP(HttpServletRequest request){
        String ip = request.getRemoteAddr();
        return ip;
    }
	
}
