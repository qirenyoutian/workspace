package com.py.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.py.bean.Camera;

public interface CameraMapper {
    int deleteByPrimaryKey(Integer cameraId);

    int insert(Camera record);

    int insertSelective(Camera record);

    Camera selectByPrimaryKey(Integer cameraId);

    int updateByPrimaryKeySelective(Camera record);

    int updateByPrimaryKey(Camera record);

	Camera selectByPrimary(Camera record);

	List<Camera> selectByExample(Camera camera);

	List<Camera> selectByNotCameraId(@Param("cameraIds")List<Integer> cameraIds);

	List<Camera> selectByExampleWithRoute();

	List<Camera> selectByExampleRtmp();
}