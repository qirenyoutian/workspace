package com.py.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Admin;
import com.py.bean.AdminAndRole;
import com.py.bean.Role;
import com.py.bean.RoleMenu;
import com.py.dao.AdminRoleMapper;
import com.py.dao.RoleMapper;
import com.py.dao.RoleMenuMapper;
import com.py.util.Msg;
import com.py.util.OfTime;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleMapper;
	@Autowired
	AdminRoleMapper adminRoleMapper;
	@Autowired
	RoleMenuMapper roleMenuMapper;
	
	
	/**
	 * 单个删除和批量删除
	 * @param roleId
	 * @param request
	 * @return
	 */
	public int deleteByPrimaryKey(Integer roleId,HttpServletRequest request) {
		
		Role role = new Role();
		if (roleId == 0) {
			String[] aa = request.getParameterValues("roleIds");
			
			List<AdminAndRole> aar = adminRoleMapper.selectByList(aa);
			if (!aar.isEmpty()) {
				return 0;
			}else{
				int delete =roleMapper.deleteByArray(aa);
				if (delete == 1) {
					return 1;
				}else{
					return 2;
				}
				
			}
			
		}else{
			role.setRoleId(roleId);
			List<AdminAndRole> adminRoleList = adminRoleMapper.selectAdminByRoleId(role);
			if (!adminRoleList.isEmpty()) {
				return 0;
			}else{
				int delete = roleMapper.deleteByPrimaryKey(roleId);
				if (delete == 1) {
					return 1;
				}else{
					return 2;
				}
			}
		}
	}

	public int insert(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.insert(record);
	}
	
	public int insertSelective(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.insertSelective(record);
	}

	public Role selectByPrimaryKey(Integer roleId) {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(roleId);
	}

	public int updateByPrimaryKeySelective(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKey(record);
	}

	public Msg selectByExample(Role role) {
		
		List<Role> rolelist = roleMapper.selectByExample(role);
		if (rolelist == null) {
			return Msg.fail();
		} else {
			return Msg.success().add("role", rolelist);
		}
		
		
	}

	public List<AdminAndRole> selectAdminByRoleId(Role role) {
		
		return adminRoleMapper.selectAdminByRoleId(role);
	}

	public List<AdminAndRole> selectAdminByAdminId(Admin admin) {
		
		
		return adminRoleMapper.selectAdminByAdminId(admin);
	}

	/**
	 * 保存角色
	 * @param request
	 * @return
	 */
	public Msg saveRole(HttpServletRequest request) {
		
		String roleName = request.getParameter("roleName");
		String roleNote = request.getParameter("roleNote");
		
		
		
		Role role = new Role();
		role.setRoleName(roleName);
		role.setRoleDetail(roleNote);
		role.setRoleCreatetime(new Date());
		int  a = roleMapper.insertSelective(role);
		
		int bb = role.getRoleId();
		
		String b[] = request.getParameterValues("menuName");
		if (b != null) {
			for (String menuId : b) {
				RoleMenu rm = new RoleMenu();
				rm.setRoleMenuRoleId(bb);
				rm.setRoleMenuMenuId(Integer.parseInt(menuId));
				roleMenuMapper.insertSelective(rm);
			}
		}
		
		
		return Msg.success().add("msg", a);
	}
	//检查Role名
	public Msg checkAdmin(Role role) {
		
		Role rr  = roleMapper.selectByPrimary(role);
		if (rr == null) {
			return Msg.fail();
		}else{
			return Msg.success();
		}
		
	}

	/**
	 * 根据id获取角色
	 * @param roleId
	 * @return
	 */
	public Msg getRoleById(Integer roleId) {
		
		Role role = roleMapper.selectByPrimaryKey(roleId);
		
		return Msg.success().add("msg", role);
	}

	public List<RoleMenu> selectRoleAndMenu(Integer roleId) {
		
		List<RoleMenu> rm = roleMenuMapper.selectByRoleId(roleId);
		
		
		return rm;
	}

	
	/**
	 * 更新角色
	 * @param request
	 * @return
	 */
	public Msg updateRole(HttpServletRequest request) {
		String roleId = request.getParameter("roleId");
		String roleNote = request.getParameter("roleNote");
		String menus[] = request.getParameterValues("menuName");
		
		Role role = new Role();
		role.setRoleDetail(roleNote);
		role.setRoleId(Integer.parseInt(roleId));
		roleMapper.updateByPrimaryKeySelective(role);//修改角色备注
		
		//修改菜单权限
		RoleMenu rm = new RoleMenu();
		rm.setRoleMenuRoleId(Integer.parseInt(roleId));
		
		List<RoleMenu> rolem = roleMenuMapper.selectByRoleId(Integer.parseInt(roleId));
		if (rolem != null) { //如果不为空先删除对应权限
			 roleMenuMapper.deleteByRoleId(rm);
		}
			for (String menu : menus) {
				RoleMenu rm2 = new RoleMenu();
				rm2.setRoleMenuMenuId(Integer.parseInt(menu));
				rm2.setRoleMenuRoleId(Integer.parseInt(roleId));
				roleMenuMapper.insertSelective(rm2);
			}
			return Msg.success();
		}
	
	
	
	
	
	
}
