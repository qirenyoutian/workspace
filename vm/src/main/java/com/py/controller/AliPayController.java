package com.py.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeCancelRequest;
import com.alipay.api.request.AlipayTradePrecreateRequest;
import com.alipay.api.request.AlipayTradeQueryRequest;
import com.alipay.api.response.AlipayTradeCancelResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.py.bean.Alipay;
import com.py.bean.Merchandise;
import com.py.bean.Order;
import com.py.dao.AlipayMapper;
import com.py.dao.MerchandiseMapper;
import com.py.service.OrderService;
import com.py.util.pay.AlipayConfig;
import com.py.util.pay.QRcodeUtil;

import net.sf.json.JSONObject;

@Controller
public class AliPayController {

	@Autowired
	MerchandiseMapper merchandiseMapper;
	@Autowired
	AlipayMapper alipayMapper;
	@Autowired
	OrderService orderService;
	
	/**
     * 支付逻辑
     * 1、商户系统调用支付宝预下单接口alipay.trade.precreate，获得该订单二维码图片地址。
     * 2、发起轮询获得支付结果：等待5秒后调用交易查询接口alipay.trade.query通过支付时传入的商户订单号(out_trade_no)查询支付结果（返回参数TRADE_STATUS），
     如果仍然返回等待用户付款（WAIT_BUYER_PAY），则再次等待5秒后继续查询，直到返回确切的支付结果（成功TRADE_SUCCESS 或 已撤销关闭TRADE_CLOSED），
     或是超出轮询时间。在最后一次查询仍然返回等待用户付款的情况下，必须立即调用交易撤销接口alipay.trade.cancel将这笔交易撤销，避免用户继续支付。
     * 3、除了主动轮询，也可以通过接受异步通知获得支付结果
     */
    /**
     * 阿里订单取消接口
     * 请求返回值示例:
     * {"alipay_trade_cancel_response":{"code":"40004","msg":"Business Failed","sub_code":"ACQ.INVALID_PARAMETER","sub_msg":"参数无效","out_trade_no":"20150320010101002",
     * "retry_flag":"N"},"sign":""}[DEBUG] 2018-02-09 10:54:24,101 method:org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdviceChain.invoke(ResponseBodyAdviceChain.java:61)
     * @return
     * @throws AlipayApiException
     */
    @RequestMapping(value = "aliremove.do")
    @ResponseBody
    private Map<String, Object> remove(@Param("orderid")String orderid) throws AlipayApiException {
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.ServiceUrl, AlipayConfig.app_id, AlipayConfig.private_key, "json", AlipayConfig.input_charset, AlipayConfig.zfb_public_key, "RSA2"); //获得初始化的AlipayClient
        AlipayTradeCancelRequest request = new AlipayTradeCancelRequest();//创建API对应的request类
        Map<String,Object> returnmap=new HashMap<>();
        try {
            //判断订单是否完成支付,完成支付的订单禁止撤销
            //int i = this.proOrdersService.selectOrderStatus(orderid);
            int i = 1;
            if (i==1)
            {
                returnmap.put("type","0");
                returnmap.put("data","订单已支付，撤销订单失败");
            }else {
                Map<String,Object> map=new HashMap<>();
                map.put("out_trade_no",orderid);
                String returndata = JSONObject.fromObject(map).toString();
                request.setBizContent(returndata); //设置业务参数
                AlipayTradeCancelResponse response = alipayClient.execute(request);//通过alipayClient调用API，获得对应的response类
                JSONObject query_response = JSONObject.fromObject(response.getBody()).getJSONObject("alipay_trade_cancel_response");
                String code = query_response.getString("code");
                String msg = query_response.getString("msg");
                if (code.equals("10000") && msg.equals("Success")) {
                    System.out.println("阿里订单取消接口调用成功！");
                    returnmap.put("type","1");
                    returnmap.put("data","撤销订单成功");
                }else {
                    System.out.println("撤销订单请求失败");
                    returnmap.put("type","0");
                    returnmap.put("data",query_response.getString("sub_msg"));
                    System.out.println(query_response);//返回失败信息
                }
                //根据response中的结果继续业务逻辑处理
            }
        }catch (Exception e)
        {
            System.out.println("撤销订单异常");
            e.printStackTrace();
        }
        return returnmap;
    }

    /**
     * 阿里交易查询接口
     * out_trade_no	支付时传入的商户订单号，与trade_no必填一个
     *  trade_no	支付时返回的支付宝交易号，与out_trade_no必填一个
     *  请求返回值示例：
     *  {"alipay_trade_query_response":{"code":"10000","msg":"Success","buyer_logon_id":"159****4027","buyer_pay_amount":"0.01","buyer_user_id":"2088012351746164",
     *  "fund_bill_list":[{"amount":"0.01","fund_channel":"PCREDIT"}],"invoice_amount":"0.01","out_trade_no":"020910312752381","point_amount":"0.00","receipt_amount":"0.01",
     *  "send_pay_date":"2018-02-09 10:31:45","total_amount":"0.01","trade_no":"2018020921001004160275738069","trade_status":"TRADE_SUCCESS"},
     *  "sign":""}
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/aliget")
    @ResponseBody
    private Map<String, Object> get(@Param("orderid")String orderid) throws AlipayApiException{
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.ServiceUrl, AlipayConfig.app_id, AlipayConfig.private_key, "json", AlipayConfig.input_charset, AlipayConfig.zfb_public_key, "RSA2"); //获得初始化的AlipayClient
        AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();//创建API对应的request类
        Map<String,Object> map=new HashMap<>();
        map.put("out_trade_no",orderid);
        String returndata = JSONObject.fromObject(map).toString();
        request.setBizContent(returndata); //设置业务参数
        AlipayTradeQueryResponse response = alipayClient.execute(request);//通过alipayClient调用API，获得对应的response类
        JSONObject jsonObject = JSONObject.fromObject(response.getBody()).getJSONObject("alipay_trade_query_response");
        String code = jsonObject.getString("code");
        String msg = jsonObject.getString("msg");
        Map<String,Object> returnmap=new HashMap<>();
        if (code.equals("10000") && msg.equals("Success"))
        {
            System.out.println("交易查询请求成功");
            String trade_status = jsonObject.getString("trade_status");
            if (trade_status.equals("TRADE_SUCCESS"))
            {
                returnmap.put("type","1");
                returnmap.put("data","支付成功");
            }else {
                returnmap.put("type","0");
                returnmap.put("data",trade_status);
            }
        }else {
            System.out.println("交易查询请求失败");
            returnmap.put("type","0");
            returnmap.put("data",jsonObject.getString("sub_msg"));
            System.out.println(jsonObject);//返回失败信息
        }
        return returnmap;
    }
    /**
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
    @RequestMapping(value="/alipay.do")
    @ResponseBody
    private Map<String,Object> list(HttpServletResponse responses, @Param("orderid")String orderid) throws AlipayApiException{
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.ServiceUrl, AlipayConfig.app_id, AlipayConfig.private_key, "json", AlipayConfig.input_charset, AlipayConfig.zfb_public_key, "RSA2"); //获得初始化的AlipayClient
        AlipayTradePrecreateRequest request = new AlipayTradePrecreateRequest();//创建API对应的request类

        Map<String,Object> map=new HashMap<>();
        if (orderid.isEmpty()){
            map.put("type","2");
            map.put("data","订单号不能为空");
            return map;
        }
        //设置回调地址
        request.setNotifyUrl("http://39.108.98.164/aliPayCallBack.do");
        //根据订单号查询订单信息
        //ProductOrders productOrders = this.proOrdersService.selectByOrderId(orderid);
        Map<String,Object> maps=new HashMap<String,Object>();
        //maps.put("out_trade_no",productOrders.getOrdernumber());
        maps.put("total_amount","0.01");
        maps.put("subject","小编机器人纠错");
        maps.put("store_id","XB001");
        maps.put("timeout_express","1m");
        //把订单信息转换为json对象的字符串
        String postdata = JSONObject.fromObject(maps).toString();
        request.setBizContent(postdata);
        AlipayTradePrecreateResponse response = alipayClient.execute(request);
        String body = response.getBody();
        JSONObject jsonObject = JSONObject.fromObject(body);
        String qr_code = jsonObject.getJSONObject("alipay_trade_precreate_response").getString("qr_code");
        //流输出
        ServletOutputStream sos = null;
        try {
            sos = responses.getOutputStream();
            //生成二维码
            QRcodeUtil.encode(qr_code, sos);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 支付宝支付成功回调
     */
    @RequestMapping(value = "/aliPayCallBack")
    @ResponseBody
    public void aliPayCallBack(HttpServletResponse response, HttpServletRequest request) {
        System.out.println("支付宝回调成功");
        try {
            //获取支付宝POST过来反馈信息
            Map<String,String> params = new HashMap<String,String>();
            Map requestParams = request.getParameterMap();
            for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String[] values = (String[]) requestParams.get(name);
                String valueStr = "";
                for (int i = 0; i < values.length; i++) {
                    valueStr = (i == values.length - 1) ? valueStr + values[i]
                            : valueStr + values[i] + ",";
                }
                //乱码解决，这段代码在出现乱码时使用。
                //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
                params.put(name, valueStr);
            }
            // 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
            String order_no = request.getParameter("out_trade_no"); // 获取订单号

			String trade_no = request.getParameter("trade_no"); // 支付宝交易号
//			String total_amount = request.getParameter("total_amount"); // 获取总金额
//			String subject = new String(request.getParameter("subject")
//					.getBytes("ISO-8859-1"), "gbk");// 商品名称、订单名称
//			String body = "";
//			if (request.getParameter("body") != null) {
//				body = new String(request.getParameter("body").getBytes(
//						"ISO-8859-1"), "gbk");// 商品描述、订单备注、描述
//			}
			String buyer_email = request.getParameter("buyer_email"); // 买家支付宝账号
//            String trade_status = request.getParameter("trade_status"); // 交易状态
            
            Order order = orderService.selectByPrimaryKey(Integer.parseInt(order_no));
            if(order != null) {
            	
            	Merchandise merchandise = merchandiseMapper.selectByPrimaryKey(order.getOrderMerchandiseId());
            	if(merchandise != null) {
            		Alipay alipay = alipayMapper.selectByCommercialTenantId(Integer.parseInt(merchandise.getMerchandiseCommercialTenantNumber()));
            		if(alipay != null && alipay.getZfbPublicKey() != null) {
            			boolean flag = AlipaySignature.rsaCheckV1(params, alipay.getZfbPublicKey(), AlipayConfig.input_charset,"RSA2");
                		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
                		if (flag==true) {// 验证成功
                			//int i = this.proOrdersService.updateByOrderId(order_no);
            				int i = orderService.payCallBack(order, buyer_email,trade_no);
            				if (i==1){
            					System.out.println("支付宝订单支付成功！");
            				}
                		}
                		response.getWriter().write("success");
            		}
            	}
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
}
