package com.py.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.py.bean.Camera;
import com.py.dao.CameraMapper;

@Service
public class CameraService {
	
	@Autowired
	CameraMapper cameraMapper;

	public int deleteByPrimaryKey(Integer cameraId) {
		return cameraMapper.deleteByPrimaryKey(cameraId);
	}

	public int insert(Camera record) {
		return cameraMapper.insert(record);
	}

	public int insertSelective(Camera record) {
		return cameraMapper.insertSelective(record);
	}

	public Camera selectByPrimaryKey(Integer cameraId) {
		return cameraMapper.selectByPrimaryKey(cameraId);
	}

	public int updateByPrimaryKeySelective(Camera record) {
		return cameraMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Camera record) {
		return cameraMapper.updateByPrimaryKey(record);
	}

	public Camera selectByPrimary(Camera record) {
		return cameraMapper.selectByPrimary(record);
	}

	public List<Camera> selectByExample(Camera camera) {
		return cameraMapper.selectByExample(camera);
	}

	public List<Camera> selectByNotCameraId(List<Integer> cameraIds) {
		return cameraMapper.selectByNotCameraId(cameraIds);
	}

	public List<Camera> selectByExampleWithRoute() {
		return cameraMapper.selectByExampleWithRoute();
	}

	public List<Camera> selectByExampleRtmp() {
		// TODO Auto-generated method stub
		return cameraMapper.selectByExampleRtmp();
	}

}
