package com.py.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Snapshot;
import com.py.dao.SnapshotMapper;

@Service
public class SnapshotService {

	@Autowired
	SnapshotMapper snapshotMapper;
	
	public int deleteByPrimaryKey(Integer snapshotId) {
		return snapshotMapper.deleteByPrimaryKey(snapshotId);
	}

	public int insert(Snapshot record) {
		return snapshotMapper.insert(record);
	}

	public int insertSelective(Snapshot record) {
		return snapshotMapper.insertSelective(record);
	}

	public Snapshot selectByPrimaryKey(Integer snapshotId) {
		return snapshotMapper.selectByPrimaryKey(snapshotId);
	}

	public int updateByPrimaryKeySelective(Snapshot record) {
		return snapshotMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Snapshot record) {
		return snapshotMapper.updateByPrimaryKey(record);
	}

}
