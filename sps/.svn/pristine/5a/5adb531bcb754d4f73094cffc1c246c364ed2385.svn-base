package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Menu;
import com.py.dao.MenuMapper;

@Service
public class MenuService {
	@Autowired
	MenuMapper menuMapper;
	public int deleteByPrimaryKey(Integer menuId) {
		return menuMapper.deleteByPrimaryKey(menuId);
	}

	public int insert(Menu record) {
		return menuMapper.insert(record);
	}

	public int insertSelective(Menu record) {
		return menuMapper.insertSelective(record);
	}

	public Menu selectByPrimary(Menu record) {
		return menuMapper.selectByPrimary(record);
	}
    
	public List<Menu> selectByExample(Menu record) {
		return menuMapper.selectByExample(record);
	}

	public int updateByPrimaryKeySelective(Menu record) {
		return menuMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Menu record) {
		return menuMapper.updateByPrimaryKey(record);
	}
}
