package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Menu;
import com.py.dao.MenuMapper;
import com.py.util.Msg;


@Service
public class MenuService{
	@Autowired
	MenuMapper menuMapper;

	public int deleteByPrimaryKey(Integer menuId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insert(Menu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertSelective(Menu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Menu selectByPrimaryKey(Integer menuId) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateByPrimaryKeySelective(Menu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateByPrimaryKey(Menu record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Msg selectByExample(Menu menu) {
		
		List<Menu> menulist = menuMapper.selectByExample(menu);
		
		Msg msg = new Msg();
		msg.add("pageInfo", menulist);
		return msg;
	}

}
