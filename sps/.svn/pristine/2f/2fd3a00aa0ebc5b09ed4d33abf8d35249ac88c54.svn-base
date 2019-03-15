package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Invoice;
import com.py.dao.InvoiceMapper;

@Service
public class InvoiceService {

	@Autowired
	InvoiceMapper invoiceMapper;
	
	public int deleteByPrimaryKey(Integer invoiceId) {
		return invoiceMapper.deleteByPrimaryKey(invoiceId);
	}

	public int insert(Invoice record) {
		return invoiceMapper.insert(record);
	}

	public int insertSelective(Invoice record) {
		return invoiceMapper.insertSelective(record);
	}

	public Invoice selectByPrimaryKey(Integer invoiceId) {
		return invoiceMapper.selectByPrimaryKey(invoiceId);
	}

	public int updateByPrimaryKeySelective(Invoice record) {
		return invoiceMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Invoice record) {
		return invoiceMapper.updateByPrimaryKey(record);
	}

	public Invoice selectByPrimary(Invoice invoice) {
		return invoiceMapper.selectByPrimary(invoice);
	}

	public List<Invoice> selectByExample(Invoice invoice) {
		return invoiceMapper.selectByExample(invoice);
	}

}
