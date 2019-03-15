package com.py.dao;

import java.util.List;

import com.py.bean.Invoice;

public interface InvoiceMapper {
    int deleteByPrimaryKey(Integer invoiceId);

    int insert(Invoice record);

    int insertSelective(Invoice record);

    Invoice selectByPrimaryKey(Integer invoiceId);

    int updateByPrimaryKeySelective(Invoice record);

    int updateByPrimaryKey(Invoice record);

	Invoice selectByPrimary(Invoice invoice);

	List<Invoice> selectByExample(Invoice invoice);
}