package com.py.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.py.bean.Menu;
import com.py.bean.RoleMenu;
import com.py.service.MenuService;
import com.py.service.RoleMenuService;
import com.py.util.BooleanString;
import com.py.util.Msg;

@Controller
public class MenuController {
	@Autowired
	MenuService menuService;
	@Autowired
	RoleMenuService roleMenuService;
	/**
	 * 跳转到菜单页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/jumpMenu")
	public String jumpMenu(Model model){
		return "menu/menu";
	}
	/**
	 * 查询全部菜单
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/getMenuAll")
	@ResponseBody
	public Msg getMenuAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String content,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		byte[] b = content.getBytes("ISO-8859-1");//用tomcat的格式（iso-8859-1）方式去读。
		String string = new String(b,"utf-8");//采用utf-8去接string
		response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
		PageHelper.startPage(pn, 10);
		Menu menu = new Menu();
		if(!string.equals(null) && !string.equals("") && !string.equals(" ")){
			menu.setMenuName(string);
		}
		List<Menu> menuList = menuService.selectByExample(menu);
		PageInfo<Menu> page = new PageInfo<Menu>(menuList, 5);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询全部菜单
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/getMenu",method=RequestMethod.GET)
	@ResponseBody
	public Msg getMenu() throws UnsupportedEncodingException {
		Menu menu = new Menu();
		menu.setMenuSuperior("主菜单");
		List<Menu> menuList = menuService.selectByExample(menu);
		return Msg.success().add("menuList", menuList);
	}
	/**
	 * 添加
	 * 1、支持JSR303校验
	 * 2、导入Hibernate-Validator
	 */
	@RequestMapping(value="/saveMenu",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveMenu(@Valid Menu menu,BindingResult result,HttpServletRequest request){
		if(result.hasErrors()){
			//校验失败，应该返回失败，在模态框中显示校验失败的错误信息
			Map<String, Object> map = new HashMap<String, Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息："+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			menu.setMenuSuperior(request.getParameter("SaveMenuSuperior"));
			int result1 = menuService.insert(menu);
			if(result1 != 0){
				return Msg.success();
			}else{
				return Msg.fail();
			}
		}
	}

	/**
	 * 检查菜单名称是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkMenuName",method=RequestMethod.POST)
	public Msg checkMenuName(@RequestParam("menuName")String menuName){
		Menu menu = new Menu();
		menu.setMenuName(menuName);
		Menu m = menuService.selectByPrimary(menu);
		if(m == null){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg", "菜单名称已存在,不能重复");
		}
	}
	/**
	 * 检查菜单路径是否可用
	 */
	@ResponseBody
	@RequestMapping(value="/checkMenuUrl",method=RequestMethod.POST)
	public Msg checkMenuUrl(@RequestParam("menuUrl")String menuUrl){
		boolean bool1 = BooleanString.isChinese(menuUrl);
 		if(bool1){
			return Msg.fail().add("va_msg", "菜单路径不能含有中文");
		}
 		boolean bool2 = BooleanString.isContainNumber(menuUrl);
 		if(bool2){
 			return Msg.fail().add("va_msg", "菜单路径不能含有数字");
 		}
 		return Msg.success();
	}
	
	/**
	 * 根据id查询单列
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getMenuById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getMenuById(@PathVariable("id")Integer id){
		Menu menu = new Menu();
		menu.setMenuId(id);
		Menu m = menuService.selectByPrimary(menu);
		if(m != null){
			return Msg.success().add("menu", m);
		}else{
			return Msg.fail().add("va_msg", "未找到该菜单信息");
		}
	}
	
	/**
	 * 更新
	 */
	@ResponseBody
	@RequestMapping(value="/updateMenu/{id}",method=RequestMethod.PUT)
	public Msg updateMenu(@Valid Menu menu,HttpServletRequest request){
		menu.setMenuSuperior(request.getParameter("UpdateMenuSuperior"));
		int result = menuService.updateByPrimaryKeySelective(menu);
		if(result != 0){
			return Msg.success();
		}else{
			return Msg.fail();
		}
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除：1-2-3
	 * 单个删除：1
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteMenu/{ids}",method=RequestMethod.DELETE)
	public Msg deleteMenu(@PathVariable("ids")String ids){
		//批量删除
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				String reString = this.delete(id);
				if(!reString.equals("成功")){
					return Msg.fail().add("va_msg", reString);
				}else{
					int re = menuService.deleteByPrimaryKey(id);
					if(re == 0){
						return Msg.fail().add("va_msg", reString);
					}
				}
			}
			for (int i = 0; i < str_ids.length; i++) {
				Integer id = Integer.parseInt(str_ids[i]);
				String reString2 = this.update(id);
				if(!reString2.equals("成功")){
					return Msg.fail().add("va_msg", reString2);
				}
			}
		}else{
			Integer id = Integer.parseInt(ids);
			String reString = this.delete(id);
			if(!reString.equals("成功")){
				return Msg.fail().add("va_msg", reString);
			}else{
				int re = menuService.deleteByPrimaryKey(id);
				if(re == 0){
					return Msg.fail().add("va_msg", reString);
				}
			}
			String reString2 = this.update(id);
			if(!reString2.equals("成功")){
				return Msg.fail().add("va_msg", reString);
			}
		}
		return Msg.success().add("va_msg", "处理成功");
	}
	public String delete(int id){
		RoleMenu roleMenu = new RoleMenu();
		roleMenu.setRoleMenuMenuId(id);
		List<RoleMenu> roleMenuList = roleMenuService.selectByExample(roleMenu);
		if(roleMenuList.size() > 0){
			for (int j = 0; j < roleMenuList.size(); j++) {
				int result = roleMenuService.deleteByPrimaryKey(roleMenuList.get(j).getRoleMenuId());
				if(result == 0){
					return "删除角色菜单信息失败";
				}
			}
		}
		return "成功";
	}
	public String update(int id){
		List<Menu> menuList = menuService.selectByExample(new Menu());
		for (int i = 0; i < menuList.size(); i++) {
			if(!menuList.get(i).getMenuSuperior().equals("主菜单")){
				Menu bm = new Menu();
				bm.setMenuName(menuList.get(i).getMenuSuperior());
				if(menuService.selectByPrimary(bm) == null){
					menuList.get(i).setMenuSuperior("主菜单");
					int result = menuService.updateByPrimaryKeySelective(menuList.get(i));
					if(result != 0){
						return "成功";
					}else{
						return "更新角色信息失败";
					}
				}
			}
		}
		return "成功";
	}
}
