package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.activemq.filter.function.makeListFunction;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Channel;
import com.py.bean.ChannelMerchandise;
import com.py.bean.ChannelPayment;
import com.py.bean.CommercialTenant;
import com.py.bean.Dictionary;
import com.py.bean.DictionaryClassify;
import com.py.bean.Merchandise;
import com.py.bean.Payment;
import com.py.service.ChannelMerchandiseService;
import com.py.service.ChannelService;
import com.py.service.CommercialTenantService;
import com.py.service.MerchandiseService;
import com.py.service.PaymentService;
import com.py.service.SystemService;
import com.py.util.Msg;

@Controller
public class ChannelMerchandiseController {
	
	@Autowired
	private ChannelMerchandiseService channelMerchandiseService;//渠道商品管理
	@Autowired
	private ChannelService channelService;//渠道管理
	@Autowired
	private CommercialTenantService commercialTenantService;//商户管理
	@Autowired
	private MerchandiseService merchandiseService;//商品管理
	@Autowired
	private SystemService systemService;//字典
	
	
	
	
	/******************************************************* 商品管理 ***********************************************************/
	
	
	
	/******************************************************* 渠道管理 ***********************************************************/
	
	/**
	 * 根据条件性查找渠道
	 * @param pn
	 * @param content
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/getChannelAll")
	@ResponseBody
	public Msg getChannelAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam("content")String content,HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		List<Channel> menuList = null;
		Channel channel = new Channel();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
			String string = new String(b,"utf-8");//采用utf-8去接string
			response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
			channel.setChannelName(string);
		}
		
		menuList = channelService.selectByExample(channel);
		PageInfo<Channel> page = new PageInfo<Channel>(menuList, 5);
		return Msg.success().add("pageInfo", page);
	}
	//	List<ChannelPayment> selectPayTypeByChannelId(@Param("channelId")Integer channelId);
	
	/**
	 * 根据渠道ID查找支付方式
	 * @param channelId
	 * @return
	 */
	@RequestMapping("/getPaymentByChannelId")
	@ResponseBody
	public Msg getPaymentByChannelId(@RequestParam("channelId")Integer channelId){
		
		List<Channel> payment = channelService.selectPaymentByChannelId(channelId);
		
		return Msg.success().add("list", payment);
	}
	
	
	/**
	 * 保存渠道
	 * @param request
	 * @return
	 */
	@RequestMapping("/savechannel")
	@ResponseBody
	public Msg savechannel(HttpServletRequest request){
		String name = request.getParameter("channelName");
		
		if (name.equals(null) || name.equals("")) {
			return Msg.fail().add("msg", "渠道名称不能为空！");
		}
		
		int a = channelService.savechannel(request);
		return Msg.success().add("msg", a);
	}
	
	
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping("/getChannelById")//getMerchandiseById
	@ResponseBody
	public Msg getChannelById(@RequestParam("channelId")Integer id){
		Channel channel = new Channel();
		channel.setChannelId(id);
		Channel m = channelService.selectByPrimary(channel);
		if(m != null){
			return Msg.success().add("menu", m);
		}else{
			return Msg.fail().add("va_msg", "未找到该菜单信息");
		}
	}
	
	//修改渠道信息
	@RequestMapping("/updateChannel")
	@ResponseBody
	public Msg updateChannel(HttpServletRequest request){
		String name = request.getParameter("channelName");
		
		if (name.equals(null) || name.equals("")) {
			return Msg.fail().add("msg", "渠道名称不能为空！");
		}
		
		Msg msg = channelService.updateChannel(request);
		return Msg.success().add("msg", msg);
	}

	
	//删除渠道
		@RequestMapping("/deleteChannel")
		@ResponseBody
		public Msg deleteChannel(@RequestParam("ChannelId")Integer ChannelId, @RequestParam("ChannelIds")String[] ChannelIds ){
			
			return channelService.delectChannel(ChannelId,ChannelIds);
		}
		
		/**
		 * 查找所有的渠道（不分页）
		 * @param ChannelId
		 * @param ChannelIds
		 * @return
		 */
		@RequestMapping("/getAllChannel")
		@ResponseBody
		public Msg getAllChannel(){
			
			Channel channel = new Channel();
			List<Channel> c= channelService.selectByExample(channel);
			
			return Msg.success().add("list", c);
		}
	
		
		/**
		 * 从字典里查找查询所有渠道样式
		 * @return
		 */
		@RequestMapping("/getChannelStyle")
		@ResponseBody
		public Msg getChannelStyle(){
			
			String name = "渠道样式";
			
			
			List<DictionaryClassify> dd = systemService.selectDictionaryClassifyByName(name);
			List<Dictionary> dictionaries = null;
			if (!dd.isEmpty()) {
				DictionaryClassify dictionary = new DictionaryClassify();
				dictionaries = systemService.selectDictionaryByClassifyId(dictionary.getDictionaryClassifyId());
			}
			return Msg.success().add("list", dictionaries);
		}
		
		
		
		
		
		
		
		
		
	
	/******************************************************* 商户管理 ***********************************************************/
	

		/**
		 * 根据不同的方式获取商户信息
		 * @param pn
		 * @param startTime
		 * @param endTime
		 * @param content
		 * @param request
		 * @param response
		 * @return
		 * @throws UnsupportedEncodingException
		 */
		@RequestMapping("/getCommercialtAll")
		@ResponseBody
		public Msg getCommercialtAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
				@RequestParam("content")String content,
				HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
			PageHelper.startPage(pn, 10);
			
			List<CommercialTenant> menuList = null;
			CommercialTenant commercialTenant = new CommercialTenant();
			if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
				byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
				String string = new String(b,"utf-8");//采用utf-8去接string
				response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
				commercialTenant.setCommercialTenantName(string);
				menuList = commercialTenantService.selectByExample(commercialTenant);
			}else{
				menuList = commercialTenantService.selectByExample(commercialTenant);
			}	
				
			PageInfo<CommercialTenant> page = new PageInfo<CommercialTenant>(menuList, 5);
			return Msg.success().add("pageInfo", page);
		}
		
		/**
		 * 保存商户信息
		 * @param request
		 * @return
		 */
		@RequestMapping("/saveCommer")
		@ResponseBody
		public Msg saveCommer(@RequestParam("file01")MultipartFile file01,HttpServletRequest request){
			String commercialTenantName = request.getParameter("commercialTenantName");
			String commercialTenantPerson = request.getParameter("commercialTenantPerson");
			
			if(commercialTenantName == null || "".equals(commercialTenantName)) {
				return Msg.fail().add("msg", "请填写商户名称");
			}
			if(commercialTenantPerson == null || "".equals(commercialTenantPerson)) {
				return Msg.fail().add("msg", "请填联系人");
			}
			
			Msg msg = commercialTenantService.saveCommercial(file01,request);
			return Msg.success().add("msg", msg);
		}
		
		@RequestMapping("/savePayType")
		@ResponseBody
		public Msg savePayType(@RequestParam("commercialTenantId")Integer commercialTenantId
							  ,@RequestParam("payType") Integer payType
							  ,@RequestParam("publicKey") String publicKey
							  ,@RequestParam("privateKey")String privateKey){
			
			if ("".equals(publicKey.trim()) || publicKey == null) {
				return Msg.fail().add("msg", "共有密钥不能为空！");
			}
			if ("".equals(privateKey.trim()) || privateKey == null) {
				return Msg.fail().add("msg", "私有密钥不能为空！");
			}
			
			int a = commercialTenantService.insertToPayMent(commercialTenantId,payType,publicKey,privateKey);
			if (a == 1) {
				return Msg.success().add("msg", "成功！");
			}else if(a == -1){
				return Msg.fail().add("msg", "商户已存在该支付方式");
			}else{
				return Msg.fail().add("msg", "失败！");
			}
		}
		
		
		
		/**
		 * 根据id查询单列
		 * @param id
		 * @return
		 */
		@RequestMapping("/getCommerById")//getMerchandiseById
		@ResponseBody
		public Msg getMerchandiseById(@RequestParam("commercialTenantId")Integer id){
			CommercialTenant m = commercialTenantService.selectByPrimaryKey(id);
			if(m != null){
				return Msg.success().add("menu", m);
			}else{
				return Msg.fail().add("va_msg", "未找到该菜单信息");
			}
		}
		
		/**
		 * 根据商户ID查找支付方式
		 * @param channelId
		 * @return
		 */
		@RequestMapping("/getPaymentByCommerId")
		@ResponseBody
		public Msg getPaymentByCommerId(@RequestParam("commerId")Integer commerId){
			
			List<CommercialTenant> payment = commercialTenantService.selectPaymentByChannelId(commerId);
			
			return Msg.success().add("list", payment);
		}
		
		
		
		
		//修改商户信息
		@RequestMapping("/updateCommer")
		@ResponseBody
		public Msg updateCommer(@RequestParam("file01")MultipartFile file01,HttpServletRequest request){
			String commercialTenantName = request.getParameter("commercialTenantName");
			String commercialTenantPerson = request.getParameter("commercialTenantPerson");
			
			if(commercialTenantName == null || "".equals(commercialTenantName)) {
				return Msg.fail().add("msg", "请填写商户名称");
			}
			if(commercialTenantPerson == null || "".equals(commercialTenantPerson)) {
				return Msg.fail().add("msg", "请填联系人");
			}
			
			
			Msg msg = commercialTenantService.updateCommer(file01,request);
			
			return Msg.success().add("msg", msg);
		}
		
		
		/**
		 * 根据id删除
		 * @param ids
		 * @return
		 */
		@RequestMapping("deleteCommercialt")
		@ResponseBody
		public Msg deleteCommercialt(@RequestParam("CommercialtId")Integer CommercialtId,@RequestParam("CommercialtIds")String[] CommercialtIds){
			
			return commercialTenantService.deleteById(CommercialtId,CommercialtIds);
		}
		
		/**
		 * 获取商户信息
		 * @return
		 */
		@RequestMapping("/getCommercialTenantName")
		@ResponseBody
		public Msg getCommercialTenantName(){
			
			CommercialTenant commercialTenant = new CommercialTenant();
			List<CommercialTenant> commercialTenantList = commercialTenantService.selectByExample(commercialTenant);
			return Msg.success().add("pageInfo", commercialTenantList);
		}
		
		
		
	
	
	/******************************************************* 渠道商品管理 ***********************************************************/
	
	/**
	 * 获取所有的商品信息
	 * @param pn
	 * @param content
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/getMerchandiseAll")
	@ResponseBody
	public Msg getMerchandiseAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam("content")String content,
			@RequestParam("channelMerchandiseName")String channelMerchandiseName,
			HttpServletResponse response) throws UnsupportedEncodingException {
		PageHelper.startPage(pn, 10);
		
		List<ChannelMerchandise> menuList = null;
		ChannelMerchandise channelMerchandise = new ChannelMerchandise();
		if (!content.equals("") && !content.equals(" ") && !content.equals(null)) {
			Merchandise merchandise = new Merchandise();
			merchandise.setMerchandiseName(content);
			channelMerchandise.setMerchandise(merchandise);
			
		}else if(!channelMerchandiseName.equals("") && !channelMerchandiseName.equals(" ") && !channelMerchandiseName.equals(null)){
			channelMerchandise.setChannelMerchandiseName(channelMerchandiseName);
		}
		menuList = channelMerchandiseService.selectChannelMerchandiseByExample(channelMerchandise);	
		PageInfo<ChannelMerchandise> page = new PageInfo<ChannelMerchandise>(menuList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 根据渠道ID和商户ID获取支付方式
	 * @param commercialTenantId
	 * @param channelId
	 * @return
	 */
	@RequestMapping("/getPaymentByChannelIdAndCommercialTenantId")
	@ResponseBody
	public Msg getPaymentByChannelIdAndCommercialTenantId(@RequestParam("commercialTenantNumber")Integer commercialTenantNumber,
														  @RequestParam("channelId")Integer channelId){
		
		
		
		List<Payment> payment = channelMerchandiseService.getPaymentByChannelIdAndCommercialTenantId(commercialTenantNumber,channelId);
		
		return Msg.success().add("list", payment);
	}
	
	
	
	
	/**
	 * 保存渠道商品
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveMercha")
	@ResponseBody
	public Msg saveMerchandise(HttpServletRequest request){
		String merchandiseId = request.getParameter("merchandiseId");
		String channelMerchandiseMerchandiseUrl = request.getParameter("channelMerchandiseMerchandiseUrl");
		
		try {
			if (merchandiseId.equals(null)) {
				return Msg.fail().add("msg", "请选择商品！");
			}
		} catch (Exception e) {
				return Msg.fail().add("msg", "请选择商品！");
		}
		if (channelMerchandiseMerchandiseUrl.equals(null) || channelMerchandiseMerchandiseUrl.equals("")) {
			return Msg.fail().add("msg", "请填写URL地址信息！");
		}
		
		
		
		int a = channelMerchandiseService.saveMerchandise(request);
		
		
		return Msg.success().add("msg", a);
	}
	//跟据渠道商品ID查找信息
	@RequestMapping("/getMerchanById")//
	@ResponseBody
	public Msg getMerchanById(@RequestParam("channelMerchandiseId")Integer id){
		
		ChannelMerchandise channelMerchandise = new ChannelMerchandise();
		channelMerchandise.setChannelMerchandiseId(id);
		List<ChannelMerchandise> m = channelMerchandiseService.selectChannelMerchandiseByExample(channelMerchandise);
		
		if(m != null){
			int ChannelId = 0;
			int MerchandiseId = 0;
			for (ChannelMerchandise m1 : m) {
				ChannelId = m1.getChannelMerchandiseChannelId();
				MerchandiseId = m1.getChannelMerchandiseMerchandiseId();
			}
			Merchandise merchandise = new Merchandise();
			merchandise.setMerchandiseId(MerchandiseId);
			List<Merchandise> byExample = merchandiseService.selectByExample(merchandise);
			String CommercialTenantNumber = "";
			for (Merchandise m2 : byExample) {
				CommercialTenantNumber = m2.getMerchandiseCommercialTenantNumber();
			}
			
			List<Payment> tenantId = channelMerchandiseService.getPaymentByChannelIdAndCommercialTenantId(Integer.parseInt(CommercialTenantNumber), ChannelId);
			
			Msg msg = Msg.success();
			msg.add("list", m);
			msg.add("list2", tenantId);
			return Msg.success(msg);
		}else{
			return Msg.fail().add("va_msg", "未找到该菜单信息");
		}
		
	}
	
	
	//修改商品渠道
	@RequestMapping("/updatemerchan")
	@ResponseBody
	public Msg merchandise(HttpServletRequest request){
		Msg msg = channelMerchandiseService.merchandise(request);
		return Msg.success().add("msg", msg);
	}
	
	/**
	 * 根据id删除
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deletemerchan/{id}",method=RequestMethod.DELETE)
	public Msg deletemer(@PathVariable("id")Integer id){
		if (id != null) {
			
			int a = channelMerchandiseService.deleteByPrimaryKey(id);
			if (a == 1) {
				return Msg.success().add("msg", "删除成功");
			} else {
				return Msg.fail().add("msg", "删除失败");
			}
		}else{
			return Msg.fail().add("msg", "删除失败");
		}
		
	}
	
	/**
	 * 根据商品ID查找渠道商品
	 * @param MerchandiseId
	 * @return
	 */
	
	@RequestMapping("/getChannelMerchandiseById")
	@ResponseBody
	public Msg getChannelMerchandiseById(@RequestParam("MerchandiseId")Integer MerchandiseId){
		
		ChannelMerchandise channelMerchandise = new ChannelMerchandise();
		channelMerchandise.setChannelMerchandiseMerchandiseId(MerchandiseId);
		
		List<ChannelMerchandise> list = channelMerchandiseService.selectByExample(channelMerchandise);
		
		return Msg.success().add("list", list);
	}
	
	
	
}
