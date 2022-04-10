/**  
 * @Description:TODO:
 * @Title:  IDeviceService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年5月6日 下午9:55:09   
 */
package com.walle.service;

import java.util.List;


import com.walle.entity.Device;


public interface IDeviceService {

	/**
	 * 查询所有设备
	 * @return
	 */
	public List<Device> findAllTeachers();

	/**
	 * 通过名字查询设备
	 * @param dname
	 * @return
	 */
	public List<Device> findTeachersByName(String dname);

	/**
	 * 添加设备
	 * @param de
	 */
	public void addDevice(Device de);

	/**
	 * @param string
	 * @param string2
	 * @return
	 */
	public List<Device> findUnusedDevice(String start, String end);

}
