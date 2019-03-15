package com.py.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.py.bean.Alipay;
import com.py.bean.CommercialTenant;
import com.py.bean.CommercialTenantPayment;
import com.py.bean.Merchandise;
import com.py.dao.AlipayMapper;
import com.py.dao.CommercialTenantMapper;
import com.py.dao.CommercialTenantPaymentMapper;
import com.py.util.CommonUtil;
import com.py.util.Msg;
import com.py.util.OfTime;

@Service
public class CommercialTenantService {

	@Autowired
	private CommercialTenantMapper commercialTenantMapper;
	@Autowired
	private CommercialTenantPaymentMapper commercialTenantPaymentMapper;
	@Autowired
	private AlipayMapper alipayMapper;
	
	
	

	public List<CommercialTenant> selectByExample(CommercialTenant commercialTenant) {
		return commercialTenantMapper.selectByExample(commercialTenant);
	}

	public List<CommercialTenant> selectByTime(String startTime, String endTime) {
		return commercialTenantMapper.selectByTime(startTime,endTime);
	}
	/**
	 * 保存商户信息
	 * @param file01 
	 * @param request
	 * @return
	 */
	public Msg saveCommercial(MultipartFile file01, HttpServletRequest request) {
		String commercialTenantName = request.getParameter("commercialTenantName");
		String commercialTenantPerson = request.getParameter("commercialTenantPerson");
		String commercialTenantDescribe = request.getParameter("commercialTenantDescribe");
		String commercialTenantAttr = request.getParameter("commercialTenantAttr");
		String commercialTenantPhone = request.getParameter("commercialTenantPhone");
		String commercialTenantOfficialWebsite = request.getParameter("commercialTenantOfficialWebsite");
		
		CommercialTenant commercialTenant = new CommercialTenant();
		String path = null;
		if (file01 != null && "".equals(file01)) {
			try {
				path = CommonUtil.saveFile(file01);
				commercialTenant.setCommercialTenantLogo(path);
			} catch (IllegalStateException e) {
				return Msg.fail().add("msg", "图片上传失败！");
			} catch (IOException e) {
				return Msg.fail().add("msg", "图片上传失败！");
			}
		}
		
		
		commercialTenant.setCommercialTenantName(commercialTenantName);
		commercialTenant.setCommercialTenantPerson(commercialTenantPerson);
		commercialTenant.setCommercialTenantDescribe(commercialTenantDescribe);
		commercialTenant.setCommercialTenantAttr(commercialTenantAttr);
		commercialTenant.setCommercialTenantPhone(commercialTenantPhone);
		commercialTenant.setCommercialTenantOfficialWebsite(commercialTenantOfficialWebsite);
		commercialTenant.setCommercialTenantCreateTime(new Date());
		int a = commercialTenantMapper.insertSelective(commercialTenant);
		
		if (a == 1) {
			String[] payment = request.getParameterValues("paymentName");
			if (payment != null) {
				CommercialTenantPayment ctp  = new CommercialTenantPayment();
				int c = 0;
				for (String string : payment) {
					ctp.setCommercialTenantPaymentCommercialTenantId(commercialTenant.getCommercialTenantId());
					ctp.setCommercialTenantPaymentPaymentId(Integer.parseInt(string));
					c = commercialTenantPaymentMapper.insertSelective(ctp);
				}
				if (c == 1) {
					return Msg.success();
				} else {
					return Msg.fail();
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}


	public CommercialTenant selectByPrimaryKey(Integer id) {
		return commercialTenantMapper.selectByPrimaryKey(id);
	}

	/**
	 * 商户修改
	 * @param file01 图片
	 * @param request
	 * @return
	 */
	public Msg updateCommer(MultipartFile file01, HttpServletRequest request) {
		String commercialTenantId =request.getParameter("commercialTenantId");
		String commercialTenantName = request.getParameter("commercialTenantName");
		String commercialTenantPerson = request.getParameter("commercialTenantPerson");
		String commercialTenantDescribe = request.getParameter("commercialTenantDescribe");
		String commercialTenantAttr = request.getParameter("commercialTenantAttr");
		String commercialTenantPhone = request.getParameter("commercialTenantPhone");
		String commercialTenantOfficialWebsite = request.getParameter("commercialTenantOfficialWebsite");
		
		
		
		CommercialTenant commercialTenant = new CommercialTenant();
		String path = null;
		if (file01 != null && "".equals(file01)) {
			try {
				path = CommonUtil.saveFile(file01);
				commercialTenant.setCommercialTenantLogo(path);
			} catch (IllegalStateException e) {
				return Msg.fail().add("msg", "图片上传失败！");
			} catch (IOException e) {
				return Msg.fail().add("msg", "图片上传失败！");
			}
		}
		
		commercialTenant.setCommercialTenantId(Integer.parseInt(commercialTenantId));
		commercialTenant.setCommercialTenantName(commercialTenantName);
		commercialTenant.setCommercialTenantPerson(commercialTenantPerson);
		commercialTenant.setCommercialTenantDescribe(commercialTenantDescribe);
		commercialTenant.setCommercialTenantAttr(commercialTenantAttr);
		commercialTenant.setCommercialTenantPhone(commercialTenantPhone);
		commercialTenant.setCommercialTenantOfficialWebsite(commercialTenantOfficialWebsite);
		commercialTenant.setCommercialTenantChangeTime(new Date());
		
		int a = commercialTenantMapper.updateByPrimaryKeySelective(commercialTenant);
		if (a == 1) {
			String[] payment = request.getParameterValues("paymentName");
			if (payment != null) {
				CommercialTenantPayment ctp  = new CommercialTenantPayment();
				ctp.setCommercialTenantPaymentCommercialTenantId(Integer.parseInt(commercialTenantId));
				List<CommercialTenantPayment> byExample = commercialTenantPaymentMapper.selectByExample(ctp);
				if (byExample != null && !byExample.isEmpty()) {
					commercialTenantPaymentMapper.deleteByCommerId(Integer.parseInt(commercialTenantId));
				}
					int c = 0;
					for (String string : payment) {
						ctp.setCommercialTenantPaymentPaymentId(Integer.parseInt(string));
						c = commercialTenantPaymentMapper.insertSelective(ctp);
					}
					if (c == 1) {
						return Msg.success();
					} else {
						return Msg.fail();
					}
			}
			return Msg.success();
			}else{
				return Msg.fail();
			}
		}

	public int deleteByPrimaryKey(Integer id) {
		return commercialTenantMapper.deleteByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(CommercialTenant commercialTenant) {
		return commercialTenantMapper.updateByPrimaryKeySelective(commercialTenant);
	}
	/**
	 * 根据ID删除
	 * @param commercialtId
	 * @param commercialtIds
	 * @return
	 */
	public Msg deleteById(Integer commercialtId, String[] commercialtIds) {
		
		if (commercialtId == 0) {
			int a = commercialTenantMapper.deleteByArray(commercialtIds); 
			if (a > 0) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
			
		}else{
			int a = commercialTenantMapper.deleteByPrimaryKey(commercialtId);
			if (a == 1) {
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}

	public List<CommercialTenant> selectPaymentByChannelId(Integer commerId) {
		// TODO Auto-generated method stub
		return commercialTenantMapper.selectCommerAndPaymentByCommerId(commerId);
	}
	
	
	/**
	 * 加入微信或者支付宝的支付方式
	 * @param commercialTenantId
	 * @param payType
	 * @param publicKey
	 * @param privateKey
	 */
	
	
	public int insertToPayMent(Integer commercialTenantId, Integer payType, String publicKey, String privateKey) {
		
		int a = 0;
		if (payType == 3) { //是微信
			
			
			
		}
		if (payType == 4) { //是支付宝
			
			
			Alipay alipay = alipayMapper.selectByCommercialTenantId(commercialTenantId);
			
			if (alipay != null) {
				return -1;
			}else{
				Alipay alipay2 = new Alipay();
				alipay2.setCommercialTenantId(commercialTenantId);
				alipay2.setPrivateKey(privateKey);
				alipay2.setZfbPublicKey(publicKey);
				
				alipay2.setcreateTime(OfTime.getLongTime());
				alipay2.setUpdateTime(OfTime.getLongTime());
				
				a = alipayMapper.insertSelective(alipay2);
				
			}
			
		}
		return a;
	}

}
