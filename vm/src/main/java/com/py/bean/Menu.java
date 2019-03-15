package com.py.bean;

public class Menu {
    private Integer menuId;

    private String menuName;

    private String menuDetail;

    private String menuUrl;

    private String menuSuperior;

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName == null ? null : menuName.trim();
    }

    public String getMenuDetail() {
        return menuDetail;
    }

    public void setMenuDetail(String menuDetail) {
        this.menuDetail = menuDetail == null ? null : menuDetail.trim();
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl == null ? null : menuUrl.trim();
    }

    public String getMenuSuperior() {
        return menuSuperior;
    }

    public void setMenuSuperior(String menuSuperior) {
        this.menuSuperior = menuSuperior == null ? null : menuSuperior.trim();
    }
}