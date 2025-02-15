package com.py.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/web")
@Controller
public class JumpPageController {
	
	//	管理员管理
	//	商品渠道管理
	//	设备管理
	//	货道管理
	//	商户管理
	//	点位管理
	//	订单管理
	//	数据分析
	//	运营管理
	//	仓库管理
	//	系统管理
	//	广告设置
	
	/************************************************************ 管理员管理 **********************************************************/
	/**
	 * 登陆成功
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/jumpIndex")
	public String jumpIndex(Model model,HttpServletRequest request){
		
		return "page/page";
	}
	/*
	 * 跳转主页
	 */
	@RequestMapping("/index")
	public String jumpIndex(Model model){
		
		return "index/index";
	}
	/*
	 * 跳转角色管理
	 */
	@RequestMapping("/AdminRole")
	public String AdminRole(Model model){
		
		return "admin/admin-role";
	}
	/*
	 * 跳转权限管理
	 */
	@RequestMapping("/AdminPermission")
	public String AdminPermission(Model model){
		
		return "admin/admin-permission";
	}
	/*
	 * 跳转管理员列表
	 */
	@RequestMapping("/AdminList")
	public String AdminList(Model model){
		
		return "admin/admin-list";
	}
	/**
	 * 跳转添加管理员
	 */

	//addAdmin
	@RequestMapping("/addAdmin")
	public String addAdmin(Model model){
		
		return "admin/admin-add";
	}
	
	/*
	 * 跳转角色管理
	 */
	@RequestMapping("/addRole")
	public String addRole(Model model){
		
		return "admin/admin-role-add";
	}
	/*
	 * 跳转角色编辑
	 */
	@RequestMapping("/EditRole")
	public String EditRole(Model model){
		
		return "admin/admin-role-edit";
	}
	
	//跳转管理员编辑
	@RequestMapping("/AdminEdit")
	public String addAdminEdit(Model model){
		
		return "admin/admin-edit";
	}
	
	//跳转分配角色页面
	@RequestMapping("/adminEditRole")
	public String adminEditRole(Model model){
		
		return "admin/admin-role-menu";
	}
	
	
	
	
	
	
	
	
	/************************************************************ 商品渠道管理 **********************************************************/
	
	//跳转商品
	@RequestMapping("/CommodityList")
	public String CommodityList(Model model){
		
		return "commodity/commodity-list";
	}
	//修改商品
	@RequestMapping("/EditCommodity")
	public String EditCommodity(Model model){
		
		return "commodity/commodity-edit";
	}
	
	
	//新增商品
	@RequestMapping("/addCommodity")
	public String addCommodity(Model model){
		
		return "commodity/commodity-add";
	}
	//跳转系统渠道
	@RequestMapping("/ChannelList")
	public String ChannelList(Model model){
			
		return "channel/channel-list";
	}
		
	//跳转系统渠道添加
	@RequestMapping("/addChannel")
	public String addChannel(Model model){
			
		return "channel/channel-add";
	}
		
	//跳转系统渠道添加
	@RequestMapping("/EditChannel")
	public String EditChannel(Model model){
			
		return "channel/channel-edit";
	}
	
	//跳转系统渠道商品列表
	@RequestMapping("/MerchandiselList")
	public String MerchandiselList(Model model){
		
		return "merchandisel/merchandisel-list";
	}
	
	//跳转系统渠道商品添加
	@RequestMapping("/addMerchandise")
	public String addMerchandise(Model model){
		
		return "merchandisel/merchandisel-add";
	}
	
	//跳转系统渠道商品编辑
	@RequestMapping("/EditMerchandise")
	public String EditMerchandise(Model model){
		
		return "merchandisel/merchandisel-edit";
	}
	
	
	
	
	/************************************************************ 设备管理 **********************************************************/

	//跳转设备管理
	@RequestMapping("/jumpEquipment")
	public String jumpEquipment(Model model){
		
		return "equipment/equipment-list";
	}

	//跳转设备管理
	@RequestMapping("/EquipmentAdd")
	public String EquipmentAdd(Model model){
		
		return "equipment/equipment-add";
	}

	
	//跳转设备修改
	@RequestMapping("/EquipmentEdit")
	public String EquipmentEdit(Model model){
		
		return "equipment/equipment-edit";
	}
	//跳转设备状态页面
	@RequestMapping("/jumpEquipmentMessage")
	public String jumpEquipmentMessage(Model model){
		
		return "equipment/equipment-message-list";
	}
	

	
	//设备类型维护
	@RequestMapping("/jumpEquipmentManage")
	public String jumpEquipmentManage(Model model){
		
		return "equipment/equipment-manages-list";
	}
	
	
	//设备类型增加
	@RequestMapping("/EquipmentClassifyAdd")
	public String EquipmentClassifyAdd(Model model){
		
		return "equipment/equipment-manages-add";
	}
	//设备类型修改
	@RequestMapping("/EquipmentClassifyUpdate")
	public String EquipmentClassifyUpdate(Model model){
		
		return "equipment/equipment-manages-edit";
	}
	
	
	
	
	
	
	
	
	
	/************************************************************ 货道管理 **********************************************************/	
	
	//跳转系统货道
	@RequestMapping("/AisleList")
	public String AisleList(Model model){
		
		return "aisle/aisle-list";
	}
	
	//跳转设备货道
	@RequestMapping("/EquipmentAisle")
	public String EquipmentAisle(Model model){
		
		return "aisle/equipment-aisle";
	}
	
	//跳转设备货道编辑
	@RequestMapping("/AisleMerChandiseEdit")
	public String AisleMerChandiseEdit(Model model){
		
		return "aisle/equipment-aisle-edit";
	}
	
	//跳转设备货道上架商品
	@RequestMapping("/AisleMerChandiseUpload")
	public String AisleMerChandiseUpload(Model model){
		
		return "aisle/equipment-aisle-upload";
	}

	
	
	
	
	
	
	
	/************************************************************ 商户管理 **********************************************************/	
	
	//跳转系统商户列表
	@RequestMapping("/CommercialTenantList")
	public String CommercialTenantList(Model model){
		
		return "commercialTenant/commercialTenant-list";
	}
	
	//跳转系统商户添加
	@RequestMapping("/addCommer")
	public String addCommer(Model model){
		
		return "commercialTenant/commercialTenant-add";
	}
	
	//跳转系统商户编辑
	@RequestMapping("/EditCommer")
	public String EditCommer(Model model){
		
		return "commercialTenant/commercialTenant-edit";
	}
	//跳转系统商户支付信息编辑
	@RequestMapping("/aliPayEdit")
	public String aliPayEdit(Model model){
		
		return "commercialTenant/commercialTenant-pay-edit";
	}
	
	
	
	
	
	


	
	/************************************************************ 点位管理 **********************************************************/
	
	//跳转系统点位管理
	@RequestMapping("/PointList")
	public String PointList(Model model){
		
		return "point/point-list";
	}
	
	//跳转系统点位管理添加
	@RequestMapping("/addPoint")
	public String addPoint(Model model){
		
		return "point/point-add";
	}
	
	
	//跳转系统点位管理添加
	@RequestMapping("/EditPoint")
	public String EditPoint(Model model){
		
		return "point/point-edit";
	}
	
	//跳转系统点位管理添加
	@RequestMapping("/EditCommodityStatus")
	public String EditCommodi(Model model){
		
		return "commodity/commodity-status";
	}
	
	
	
	
	
	/************************************************************ 订单管理 **********************************************************/
	
	//跳转订单管理
		@RequestMapping("/jumpOrder")
		public String jumpOrder(Model model){
			
			return "order/order-list";
		}
		
	
	
		
	/************************************************************ 数据分析 **********************************************************/	
		
		//跳转点位销售报表
			@RequestMapping("/jumpPointQuery")
			public String jumpPointQuery(Model model){
				
				return "data/data-point";
			}
		
		//跳转商户销售报表
		@RequestMapping("/jumpCommerReport")
		public String jumpCommerReport(Model model){
			
			return "data/data-commer";
		}
			
		//跳转商品销售报表
		@RequestMapping("/jumpMerchandiseRank")
		public String jumpMerchandiseRank(Model model){
			
			return "data/data-merchandise";
		}
		
		
		
	
	/************************************************************ 运营管理 **********************************************************/	
	
		//跳转铺货计划
		@RequestMapping("/jumpPavePlan")
		public String jumpPavePlan(Model model){
			
			return "operat/pave-plan-list";
		}
		
		//跳转铺货计划
		@RequestMapping("/PavePlanAdd")
		public String PavePlanAdd(Model model){
			
			return "operat/pave-plan-add";
		}
		
		
		//跳转铺货记录
		@RequestMapping("/jumpPaveRecord")
		public String paveDetail(Model model){
			
			return "operat/pave-record-list";
		}
		
		
		//跳转铺货记录详情
		@RequestMapping("/paveDetail")
		public String jumpPaveRecord(Model model){
			
			return "operat/pave-record-detail";
		}
		
		
		
		//跳转铺货记录查询
		@RequestMapping("/jumpPaveQuery")
		public String jumpPaveQuery(Model model){
			
			return "operat/pave-query";
		}
		//跳转跟办问题记录
		@RequestMapping("/jumpQuestion")
		public String jumpQuestion(Model model){
			
			return "operat/question-list";
		}
		
		
		//跳转跟办问题添加
		@RequestMapping("/QuestionAdd")
		public String jumpQuestionAdd(Model model){
			return "operat/question-add";
		}
		/*//跳转跟办问题查询
		@RequestMapping("/jumpQuestionQuery")
		public String jumpQuestionQuery(Model model){
			
			return "operat/question-query";
		}*/
			
			
			
		
		/************************************************************ 仓库管理 **********************************************************/
		
		//jumpSideboard
		
		//跳转边柜库存
		@RequestMapping("/EquipmentSiboard")
		public String EquipmentSiboard(Model model){
			
			return "Inventory/sideboard-list";
		}
		//跳转边柜库存增加
		@RequestMapping("/SiboardAdd")
		public String SiboardAdd(Model model){
			
			return "Inventory/sideboard-add";
		}

		//跳转大仓库存
		@RequestMapping("/jumpbigWarehouse")
		public String jumpbigWarehouse(Model model){
			
			return "Inventory/big-warehouse-list";
		}
		
		//跳转仓库修改
		@RequestMapping("/bigWareHouseEdit")
		public String bigWareHouseEdit(Model model){
			
			return "Inventory/big-warehouse-edit";
		}
		
		//跳转仓库增加
		@RequestMapping("/bigWareHouseAdd")
		public String bigWareHouseAdd(Model model){
			
			return "Inventory/big-warehouse-add";
		}
		
		//跳转仓库库存
		@RequestMapping("/bigWareHouseInventory")
		public String bigWareHouseInventory(Model model){
			
			return "Inventory/big-warehouse-inventory";
		}
		
		//跳转仓库库存增加
		@RequestMapping("/bigWareHouseMerchandiseAdd")
		public String bigWareHouseMerchandiseAdd(Model model){
			
			return "Inventory/big-warehouse-inventory-add";
		}
		
		//跳转仓库库存编辑
		@RequestMapping("/bigWareHouseMerchandiseEdit")
		public String bigWareHouseMerchandiseEdit(Model model){
			
			return "Inventory/big-warehouse-inventory-edit";
		}
		
		
		/************************************************************ 系统管理 **********************************************************/
		
		//跳转数据字典
		@RequestMapping("/jumpDataDictionory")
		public String jumpDataDictionory(Model model){
			
			return "system/system-data";
		}
		
		
		//跳转操作日志
		@RequestMapping("/jumpSystemLog")
		public String jumpSystemLog(Model model){
			
			return "system/system-log";
		}
		
		
		
	/************************************************************ 广告设置 **********************************************************/
		
		//跳转广告管理
		@RequestMapping("/jumpEquipmentBanner")
		public String jumpEquipmentBanner(Model model){
			
			return "banner/equipment-banner-list";
		}
		
		//跳转广告图片添加
		@RequestMapping("/jumpBannerAdd")
		public String jumpBannerAdd(Model model){
			
			return "banner/equipment-banner-add";
		}
		//跳转广告视频添加
		@RequestMapping("/jumpBannerAddVedio")
		public String jumpBannerAddVedio(Model model){
			
			return "banner/equipment-banner-add-vedio";
		}
		
		//跳转广告设置
		@RequestMapping("/jumpBannerEdit")
		public String jumpBannerEdit(Model model){
			
			return "banner/equipment-banner-edit";
		}
		
		
		
		
		
}
