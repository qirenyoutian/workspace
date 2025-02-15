package com.py.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.py.bean.BigWarehouse;
import com.py.bean.BigWarehouseInventory;
import com.py.bean.Sideboard;
import com.py.service.InventoryService;
import com.py.util.Msg;

@Controller
public class InventoryController {
	@Autowired
	InventoryService inventoryService;
	
	
	
	
	/****************************************************** 边柜库存 ************************************************************/
	
	/**
	 * 根据设备ID获取边柜库存
	 * @return
	 */
	@RequestMapping("/getsideboardById")
	@ResponseBody
	public Msg getsideboardById(@RequestParam("equipmentId")Integer equipmentId){
		
		List<Sideboard> sideboard = inventoryService.selectByEquipment(equipmentId);
		
		return Msg.success().add("msg", sideboard);
	}
	/**
	 * 保存边柜信息
	 * @param sideboardEquipmentId
	 * @param sideboardMerchandiseId
	 * @param sideboardCount
	 * @return
	 */
	@RequestMapping("/saveSideboard")
	@ResponseBody
	public Msg saveSideboard(@RequestParam("sideboardEquipmentId")Integer sideboardEquipmentId,
							 @RequestParam("sideboardMerchandiseId")Integer sideboardMerchandiseId,
							 @RequestParam("sideboardCount")Integer sideboardCount){
		
		
		Sideboard sideboard = new Sideboard();
		sideboard.setSideboardEquipmentId(sideboardEquipmentId);
		sideboard.setSideboardMerchandiseId(sideboardMerchandiseId);
		sideboard.setSideboardCount(sideboardCount);
		sideboard.setSideboardCreateTime(new Date());
		sideboard.setSideboardChangeTime(new Date());
		
		int a = inventoryService.insertBySideborad(sideboard);
		if (a == 1){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 删除商品
	 */
	
	@RequestMapping("/deleteSideboard")
	@ResponseBody
	public Msg deleteSideboard(@RequestParam("sideboardId")Integer sideboardId){
		
		if (sideboardId != null && sideboardId != 0) {
			
			int a = inventoryService.deleteById(sideboardId);
			if (a == 1) {
				return Msg.success();
			} else {
				return Msg.fail();
			}
		}else{
			return Msg.fail();
		}
		
		
	}
	
	
	
	
	
	/****************************************************** 大仓库存 ************************************************************/
	
	
	
	/**
	 * 获取大仓
	 * @return
	 */
	@RequestMapping("/getBigWarehouse")
	@ResponseBody
	public Msg getBigWarehouse(){
		
		
		BigWarehouse bigWarehouse = new BigWarehouse();
		
		List<BigWarehouse> bw = inventoryService.selectByExample(bigWarehouse);
		
		return Msg.success().add("list", bw);
	}
	/**
	 * 保存大仓
	 * @param bigWarehouseName
	 * @param bigWarehouseProvince
	 * @param bigWarehouseCity
	 * @param bigWarehouseDistrict
	 * @param bigWarehouseAddress
	 * @return
	 */
	@RequestMapping("/saveBigware")
	@ResponseBody
	public Msg saveBigware(@RequestParam("bigWarehouseName")String bigWarehouseName,
						   @RequestParam("bigWarehouseProvince")String bigWarehouseProvince,
						   @RequestParam("bigWarehouseCity")String bigWarehouseCity,
						   @RequestParam("bigWarehouseDistrict")String bigWarehouseDistrict,
						   @RequestParam("bigWarehouseAddress")String bigWarehouseAddress){
		
		BigWarehouse bigWarehouse = new BigWarehouse();
			bigWarehouse.setBigWarehouseName(bigWarehouseName);
			bigWarehouse.setBigWarehouseProvince(Integer.parseInt(bigWarehouseProvince));
			bigWarehouse.setBigWarehouseCity(Integer.parseInt(bigWarehouseCity));
			bigWarehouse.setBigWarehouseDistrict(Integer.parseInt(bigWarehouseDistrict));
			bigWarehouse.setBigWarehouseAddress(bigWarehouseAddress);
			bigWarehouse.setBigWarehouseCreateTime(new Date());
			bigWarehouse.setBigWarehouseUpdateTime(new Date());
		
		int a = inventoryService.saveBigWarewHouse(bigWarehouse);
		if (a == 1) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}

	
	/**
	 * 修改大仓
	 * @param bigWarehouseName
	 * @param bigWarehouseProvince
	 * @param bigWarehouseCity
	 * @param bigWarehouseDistrict
	 * @param bigWarehouseAddress
	 * @return
	 */
	@RequestMapping("/EditBigware")
	@ResponseBody
	public Msg EditBigware(@RequestParam("bigWarehouseId")Integer bigWarehouseId,
						   @RequestParam("bigWarehouseName")String bigWarehouseName,
						   @RequestParam("bigWarehouseProvince")String bigWarehouseProvince,
						   @RequestParam("bigWarehouseCity")String bigWarehouseCity,
						   @RequestParam("bigWarehouseDistrict")String bigWarehouseDistrict,
						   @RequestParam("bigWarehouseAddress")String bigWarehouseAddress){
		
		if (bigWarehouseName == null || "".equals(bigWarehouseName.trim())) {
			return Msg.fail().add("msg", "仓库名称不能为空!");
		}
		if (bigWarehouseProvince == null || "".equals(bigWarehouseProvince.trim())) {
			return Msg.fail().add("msg", "省份不能为空!");
		}
		if (bigWarehouseCity == null || "".equals(bigWarehouseCity.trim())) {
			return Msg.fail().add("msg", "市区不能为空!");
		}
		if (bigWarehouseDistrict == null || "".equals(bigWarehouseDistrict.trim())) {
			return Msg.fail().add("msg", "区镇不能为空!");
		}
		
		BigWarehouse bigWarehouse = new BigWarehouse();
		bigWarehouse.setBigWarehouseId(bigWarehouseId);
		bigWarehouse.setBigWarehouseName(bigWarehouseName);
		bigWarehouse.setBigWarehouseProvince(Integer.parseInt(bigWarehouseProvince));
		bigWarehouse.setBigWarehouseCity(Integer.parseInt(bigWarehouseCity));
		bigWarehouse.setBigWarehouseDistrict(Integer.parseInt(bigWarehouseDistrict));
		bigWarehouse.setBigWarehouseAddress(bigWarehouseAddress);
		bigWarehouse.setBigWarehouseUpdateTime(new Date());
		
		int a = inventoryService.editBigWarewHouse(bigWarehouse);
		if (a == 1) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	
	@RequestMapping("/getBigwareById")
	@ResponseBody
	public Msg getBigwareById(@RequestParam("bigWarehouseId")Integer bigWarehouseId){
		
		BigWarehouse bigWarehouse = new BigWarehouse();
		bigWarehouse.setBigWarehouseId(bigWarehouseId);
		
		List<BigWarehouse> list = inventoryService.selectBigWareHouseByPrimary(bigWarehouse);
		
		return Msg.success().add("list", list);
	}
	
	
	
	/****************************************************** 库存明细 ************************************************************/
	
	/**
	 * 根据仓库查找仓库库存信息
	 * @param bigWarehouseId
	 * @return
	 */
	@RequestMapping("/getBigWareInventory")
	@ResponseBody
	public Msg getBigWareInventory(@RequestParam("bigWarehouseId")Integer bigWarehouseId){
		
		//selectByPrimary
		BigWarehouseInventory bInventory = new BigWarehouseInventory();
		bInventory.setBigWarehouseInventoryBigWarehouseId(bigWarehouseId);
		
		List<BigWarehouseInventory> list = inventoryService.selectBigWareInventoryByPrimary(bInventory);
		
		return Msg.success().add("list", list);
	}
	
	/**
	 * 保存库存信息
	 * @param bigWarehouseId
	 * @param merchandiseId
	 * @param Inventory
	 * @return
	 */
	@RequestMapping("/saveBigwareInventory")
	@ResponseBody
	public Msg saveBigwareInventory(@RequestParam("bigWarehouseId")Integer bigWarehouseId,
									@RequestParam("merchandiseId")String merchandiseId,
									@RequestParam("Inventory")String Inventory){
		
		if (merchandiseId == null || "".equals(merchandiseId.trim())) {
			return Msg.fail().add("msg", "请选择商品！");
		}
		if (Inventory == null || "".equals(Inventory.trim())) {
			return Msg.fail().add("msg", "请填写库存！");
		}
		
		BigWarehouseInventory bInventory = new BigWarehouseInventory();
		bInventory.setBigWarehouseInventoryBigWarehouseId(bigWarehouseId);
		bInventory.setBigWarehouseInventoryMerchandiseId(Integer.parseInt(merchandiseId));
		bInventory.setBigWarehouseInventoryCount(Integer.parseInt(Inventory));
		bInventory.setBigWarehouseInventoryCreteTime(new Date());
		bInventory.setBigWarehouseInventoryUpdateTime(new Date());
		
		int a = inventoryService.saveBigwareInventory(bInventory);
		if (a == 1) {
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	/**
	 * 根据商品id查找库存
	 * @param MerchandiseId
	 * @return
	 */
	@RequestMapping("/getInventoryByMerchandise")
	@ResponseBody
	public Msg getInventoryByMerchandise(@RequestParam("MerchandiseId")Integer MerchandiseId){
		
		BigWarehouseInventory bInventory = new BigWarehouseInventory();
		bInventory.setBigWarehouseInventoryMerchandiseId(MerchandiseId);
		List<BigWarehouseInventory> list = inventoryService.selectBigWareInventoryByPrimary(bInventory);
		if (list == null) {
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}
	
	
	/**
	 * 根据id查找库存
	 * @param bigWarehouseId
	 * @return
	 */
	@RequestMapping("/getInventoryById")
	@ResponseBody
	public Msg getInventoryById(@RequestParam("bigWarehouseId")Integer bigWarehouseId){
		
		BigWarehouseInventory bInventory = new BigWarehouseInventory();
		bInventory.setBigWarehouseInventoryId(bigWarehouseId);
		List<BigWarehouseInventory> list = inventoryService.selectBigWareInventoryByPrimary(bInventory);
		
		return Msg.success().add("list", list);
	}
	
	
	/**
	 * 单个删除
	 * @param MerchandiseId
	 * @return
	 */
	@RequestMapping("/deleteInventory")
	@ResponseBody
	public Msg deleteInventory(@RequestParam("InventoryId")Integer InventoryId){
		int a = inventoryService.deleteInventory(InventoryId);
		if (a == 1) {
			return Msg.success();
		} else {
			return Msg.fail();
		}
	}
	
	
	

}
