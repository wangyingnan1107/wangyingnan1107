/**  
 * @Description:TODO:
 * @Title:  DeviceServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月6日 下午9:56:08   
 */
package com.walle.service.impl;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.DeviceDao;
import com.walle.entity.Device;
import com.walle.service.IDeviceService;

@Service
public class DeviceServiceImpl implements IDeviceService {
	
	@Autowired
	private DeviceDao deviceDao;

	@Override
	public List<Device> findAllTeachers() {
		List<Device> des = new ArrayList<>();
		des = deviceDao.findAll();
		return des;
	}

	@Override
	public List<Device> findTeachersByName(String dname) {
		List<Device> des = new ArrayList<>();
		des = deviceDao.findByName(dname);
		return des;
	}

	@Override
	public void addDevice(Device de) {
		// TODO Auto-generated method stub
		deviceDao.addDevice(de);
		
	}

	@Override
	public List<Device> findUnusedDevice(String start, String end) {
		List<Device> des = new ArrayList<>();
		des = deviceDao.findUnusedDevice(start,end);
		return des;
	}

}
