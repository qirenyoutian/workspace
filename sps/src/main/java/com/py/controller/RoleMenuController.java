package com.py.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.py.bean.Menu;
import com.py.bean.Role;
import com.py.bean.RoleMenu;
import com.py.service.MenuService;
import com.py.service.RoleMenuService;
import com.py.util.Msg;

@Controller
public class RoleMenuController {
	@Autowired
	RoleMenuService roleMenuService;
	@Autowired
	MenuService menuService;
	/**
	 * 查询所属菜单
	 */
	@RequestMapping(value="/selectMenuByRoleId/{roleId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg selectMenuByRoleId(@PathVariable("roleId")Integer roleId) {
		RoleMenu RoleMenu = new RoleMenu();
		RoleMenu.setRoleMenuRoleId(roleId);
		List<RoleMenu> roleMenuList = roleMenuService.selectByExample(RoleMenu);
		return Msg.success().add("roleMenuList", roleMenuList);
	}
	/**
	 * 查询全部一级菜单
	 */
	@RequestMapping(value="/selectMenuClassA",method=RequestMethod.GET)
	@ResponseBody
	public Msg selectMenuClassA(@RequestParam(value = "roleid") Integer roleid){
		//查出的所有一级菜单
		Menu m = new Menu();
		m.setMenuSuperior("主菜单");
		List<Menu> Menulist = menuService.selectByExample(m);
		//查询角色拥有的菜单
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleMenuRoleId(roleid);
		List<RoleMenu> RoleMenulist = roleMenuService.selectByExample(roleMenu);
		if(RoleMenulist.size() > 0){
			for (int i = 0; i < RoleMenulist.size(); i++) {
				if (RoleMenulist.get(i).getRoleMenuMenu().getMenuSuperior().equals("主菜单")) {
					for (int j = 0; j < Menulist.size(); j++) {
						if(Menulist.get(j).getMenuId() == RoleMenulist.get(i).getRoleMenuMenuId()){
							Menulist.get(j).setYn("1");
						}
					}
				}
			}
		}
		return Msg.success().add("classaMenulist", Menulist);
	}
	/**
	 * 查询出一级菜单中包含的数据
	 */
	@RequestMapping(value="/selectMenuByclassA",method=RequestMethod.GET)
	@ResponseBody
	public Msg selectMenuByclassA(@RequestParam(value = "menuid") Integer menuid , @RequestParam(value = "roleid")Integer roleid){
		//查出的一级菜单包含的二级菜单
		Menu m = new Menu();
		m.setMenuId(menuid);
		Menu menu = menuService.selectByPrimary(m);
		Menu selectMenu = new Menu();
		selectMenu.setMenuSuperior(menu.getMenuName());
		List<Menu> Menulist = menuService.selectByExample(selectMenu);
		//查询角色拥有的菜单
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleMenuRoleId(roleid);
		List<RoleMenu> RoleMenulist = roleMenuService.selectByExample(roleMenu);
		if(RoleMenulist.size() > 0){
			for (int i = 0; i < RoleMenulist.size(); i++) {
				if (!RoleMenulist.get(i).getRoleMenuMenu().getMenuSuperior().equals("主菜单")) {
					for (int j = 0; j < Menulist.size(); j++) {
						if(Menulist.get(j).getMenuId() == RoleMenulist.get(i).getRoleMenuMenuId()){
							Menulist.get(j).setYn("1");
						}
					}
				}
			}
		}
		return Msg.success().add("secondlevelMenulist", Menulist);
	}
	/**
	 * 更新角色菜单
	 */
	@RequestMapping(value="/updateRoleMenu",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateRoleMenu(@Valid Role role,HttpServletRequest reqest){
		//查出角色所拥有的菜单
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleMenuRoleId(role.getRoleId());
		List<RoleMenu> roleMenuList = roleMenuService.selectByExample(roleMenu);
		//把所拥有的菜单id放在list1中
		List<Integer> MenuList1 = new ArrayList<Integer>();
		List<Integer> MenuList2 = new ArrayList<Integer>();
		for (int i = 0; i < roleMenuList.size(); i++) {
			MenuList1.add(roleMenuList.get(i).getRoleMenuMenu().getMenuId());
		}
		String[] classACheckBox = reqest.getParameterValues("classACheckBox");
		if(classACheckBox.length>0){
			for (int i = 0; i < classACheckBox.length; i++) {
				RoleMenu rolem = new RoleMenu();
				rolem.setRoleMenuRoleId(role.getRoleId());
				rolem.setRoleMenuMenuId(Integer.parseInt(classACheckBox[i]));
				MenuList2.add(Integer.parseInt(classACheckBox[i]));
				//判断Menuid在MenuList1是否存在
				if(!MenuList1.contains(Integer.parseInt(classACheckBox[i]))){
					//不存在存在
					roleMenuService.insert(rolem);
				}
				String secondlevelchenckboxname = "secondlevelchenckbox"+classACheckBox[i];
				String[] secondlevelchenckbox = reqest.getParameterValues(secondlevelchenckboxname);
				if(secondlevelchenckbox.length > 0){
					for (int j = 0; j < secondlevelchenckbox.length; j++) {
						Menu menu = new Menu();
						menu.setMenuId(Integer.parseInt(secondlevelchenckbox[j]));
						RoleMenu rm = new RoleMenu();
						rm.setRoleMenuRoleId(role.getRoleId());
						rm.setRoleMenuMenuId(Integer.parseInt(secondlevelchenckbox[j]));
						MenuList2.add(Integer.parseInt(secondlevelchenckbox[j]));
						//判断Menuid在MenuList1是否存在
						if(!MenuList1.contains(Integer.parseInt(secondlevelchenckbox[j]))){
							//不存在
							roleMenuService.insert(rm);
						}
					}
				}else{
					return Msg.fail();
				}
			}
		 	List<Integer> MenuIdlist = this.ContrastList(MenuList1, MenuList2);
		 	if(MenuIdlist.size() > 0){
		 		for (int i = 0; i < MenuIdlist.size(); i++) {
			 		RoleMenu rmu = new RoleMenu();
			 		rmu.setRoleMenuRoleId(role.getRoleId());
			 		rmu.setRoleMenuMenuId(MenuIdlist.get(i));
			 		roleMenuService.deleteByPrimaryKey(roleMenuService.selectByPrimary(rmu).getRoleMenuId());
				}
			}
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	//对比两个list，取出list1中有，list2中没有的数据
	public List<Integer> ContrastList(List<Integer> list1,List<Integer> list2){
        String temp2 = list2.toString ().replaceAll ("[\\[\\]]", ",").replaceAll ("\\s+", "");
        List<Integer> list = new ArrayList<Integer>();
        for ( int i = 0; i < list1.size (); i++ )
        {
            if (temp2.indexOf ("," + list1.get (i) + ",") == -1)
            {
                list.add(list1.get (i));
            }
        }
		return list;
	}
}
