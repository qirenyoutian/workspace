package com.py.bean;

import java.io.Serializable;

public class RoleMenu implements Serializable{
    private Integer roleMenuId;

    private Integer roleMenuRoleId;

    private Integer roleMenuMenuId;
    
    private Role roleMenuRole;
    
    private Menu roleMenuMenu;

    public Integer getRoleMenuId() {
        return roleMenuId;
    }

    public void setRoleMenuId(Integer roleMenuId) {
        this.roleMenuId = roleMenuId;
    }

    public Integer getRoleMenuRoleId() {
        return roleMenuRoleId;
    }

    public void setRoleMenuRoleId(Integer roleMenuRoleId) {
        this.roleMenuRoleId = roleMenuRoleId;
    }

    public Integer getRoleMenuMenuId() {
        return roleMenuMenuId;
    }

    public void setRoleMenuMenuId(Integer roleMenuMenuId) {
        this.roleMenuMenuId = roleMenuMenuId;
    }

	public Role getRoleMenuRole() {
		return roleMenuRole;
	}

	public void setRoleMenuRole(Role roleMenuRole) {
		this.roleMenuRole = roleMenuRole;
	}

	public Menu getRoleMenuMenu() {
		return roleMenuMenu;
	}

	public void setRoleMenuMenu(Menu roleMenuMenu) {
		this.roleMenuMenu = roleMenuMenu;
	}
    
}