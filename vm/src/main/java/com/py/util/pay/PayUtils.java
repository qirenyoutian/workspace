package com.py.util.pay;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.jdom.JDOMException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.py.bean.AisleInventory;
import com.py.bean.Alipay;
import com.py.bean.ChannelMerchandise;
import com.py.bean.Order;
import com.py.bean.Weixin;
import com.py.dao.AisleInventoryMapper;
import com.py.dao.AlipayMapper;
import com.py.dao.ChannelMerchandiseMapper;
import com.py.dao.OrderMapper;
import com.py.dao.WeixinMapper;

import net.sf.json.JSONObject;

public class PayUtils {
	
	public static ApplicationContext IOC = new ClassPathXmlApplicationContext("applicationContext.xml");
	public static AlipayMapper alipayMapper = IOC.getBean(AlipayMapper.class);
	public static OrderMapper orderMapper = IOC.getBean(OrderMapper.class);
	public static WeixinMapper weixinMapper = IOC.getBean(WeixinMapper.class);
	
	//融e购验证码
	public static void e(Integer aisle_id,AisleInventoryMapper aisleInventoryMapper,ChannelMerchandiseMapper channelMerchandiseMapper,HttpServletResponse response) {
		//渠道商品链接
		String url = null;
		//根据货道id获取货道库存
		AisleInventory aisleInventory = aisleInventoryMapper.selectByAisleId(aisle_id);
		if(aisleInventory != null) {
			//获取渠道商品
			ChannelMerchandise channelMerchandise =  channelMerchandiseMapper.selectByPrimaryKey(aisleInventory.getAisleInventoryChannelMerchandiseId());
			if(channelMerchandise != null) {
				url = channelMerchandise.getChannelMerchandiseMerchandiseUrl();
				QRCodeByUrl(response, url);
			}
		}
	}
	//微信预下单
	public static void weixinpay(HttpServletResponse response, Integer orderId, Integer commercialTenantId, String merchandiseName) throws JDOMException, IOException {
		
		Weixin weixin = weixinMapper.selectByCommercialTenantId(commercialTenantId);
		if(weixin == null || weixin.getAppId() == null || weixin.getMchId() == null || weixin.getApiKey() == null) {return;}
		
		Order order = orderMapper.selectByPrimaryKey(orderId);
		
		String appid = weixin.getAppId();  // appid  
        String mch_id = weixin.getMchId(); // 商户号  
        String key = weixin.getApiKey(); // key  
        String currTime = PayCommonUtil.getCurrTime();
        String strTime = currTime.substring(8, currTime.length());  
        String strRandom = PayCommonUtil.buildRandom(4) + "";  
        String nonce_str = strTime + strRandom;          
        int order_price = (int) (order.getOrderPrice() * 100); // 商品价格   注意：价格的单位是分  
        String body = merchandiseName;   // 商品名称  
        //String out_trade_no = PayCommonUtil.getCurrTime() + PayCommonUtil.buildRandom(4); // 商户订单号  
        String out_trade_no = String.valueOf(orderId);
        // 获取发起电脑 ip  
        //String spbill_create_ip = ip;  
        // 回调接口   
        String notify_url = PayConfigUtil.NOTIFY_URL;  
        String trade_type = "NATIVE";  //交易类型          
        SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();  
        packageParams.put("appid", appid);  
        packageParams.put("mch_id", mch_id);  
        packageParams.put("nonce_str", nonce_str);  
        packageParams.put("body", body);  
        packageParams.put("out_trade_no", out_trade_no);  
        packageParams.put("total_fee", String.valueOf(order_price));  
        //packageParams.put("spbill_create_ip", spbill_create_ip);  
        packageParams.put("notify_url", notify_url);  
        packageParams.put("trade_type", trade_type);  
        //生成签名
        String sign = PayCommonUtil.createSign("UTF-8", packageParams,key);  
        packageParams.put("sign", sign);  
          
        String requestXML = PayCommonUtil.getRequestXml(packageParams);  
        System.out.println(requestXML);  
   
        String resXml = HttpUtil.postData(PayConfigUtil.UFDODER_URL, requestXML);       
        Map map = XMLUtil.doXMLParse(resXml);
        String urlCode = (String) map.get("code_url");
        QRCodeByUrl(response, urlCode);
	}
	
	/**
     * @param commercialTenantId 
	 * @param merchandiseName 
	 * @name 预下单请求，阿里获取二维码接口
     * @throws AlipayApiException
     * @Param out_trade_no 商户订单号,64个字符以内、只能包含字母、数字、下划线；需保证在商户端不重复
     * @Param total_amount 订单总金额，单位为元，精确到小数点后两位，取值范围[0.01,100000000] 如果同时传入了【打折金额】，【不可打折金额】，
     * 【订单总金额】三者，则必须满足如下条件：【订单总金额】=【打折金额】+【不可打折金额】
     * @Param subject 订单标题
     * @Param store_id 商户门店编号
     * @Param timeout_express 该笔订单允许的最晚付款时间，逾期将关闭交易。
     * 取值范围：1m～15d。m-分钟，h-小时，d-天，1c-当天（1c-当天的情况下，无论交易何时创建，都在0点关闭）。 该参数数值不接受小数点， 如 1.5h，可转换为 90m。
     */
	//支付宝预下单
	public static void alipay(HttpServletResponse responses,Order order, Integer commercialTenantId, String merchandiseName) throws AlipayApiException{
		
		Alipay alipay = alipayMapper.selectByCommercialTenantId(commercialTenantId);
		if(alipay == null || alipay.getAppId() == null || alipay.getPrivateKey() == null || alipay.getZfbPublicKey() == null) {return;}
		String app_id = alipay.getAppId();
		String private_key = alipay.getPrivateKey();
		String zfb_public_key = alipay.getZfbPublicKey();
		
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.ServiceUrl, app_id, private_key, "json", AlipayConfig.input_charset, zfb_public_key, "RSA2"); //获得初始化的AlipayClient
        AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();//创建API对应的request类

        //设置回调地址
        request.setNotifyUrl(AlipayConfig.notify_url);
        //根据订单号查询订单信息
        Map<String,Object> maps=new HashMap<String,Object>();
        maps.put("out_trade_no",order.getOrderId());
        maps.put("total_amount",order.getOrderPrice());
        maps.put("subject",merchandiseName);
        //maps.put("store_id","XB001");
        maps.put("timeout_express","5m");
        //把订单信息转换为json对象的字符串
        String postdata = JSONObject.fromObject(maps).toString();
        request.setBizContent(postdata);
        AlipayTradePrecreateResponse response = alipayClient.execute(request);
        String body = response.getBody();
        JSONObject jsonObject = JSONObject.fromObject(body);
        try {
        	String qr_code = jsonObject.getJSONObject("alipay_trade_precreate_response").getString("qr_code");
        	QRCodeByUrl(responses, qr_code);
		} catch (Exception e) {}
    }
	
	//生成二维码
	public static void QRCodeByUrl(HttpServletResponse response,String url){
		if(!url.isEmpty()) {
			//流输出
	        ServletOutputStream sos = null;
	        try {
	            sos = response.getOutputStream();
	            //生成二维码
	            QRcodeUtil.encode(url, sos);
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
	}

}
