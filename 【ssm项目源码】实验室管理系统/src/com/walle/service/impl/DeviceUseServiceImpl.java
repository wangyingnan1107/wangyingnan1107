/**  
 * @Description:TODO:
 * @Title:  DeviceUseServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:19:19   
 */
package com.walle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.DevUseDao;
import com.walle.entity.DevUse;
import com.walle.service.IDevUseService;

@Service
public class DeviceUseServiceImpl implements IDevUseService {

	@Autowired
	private DevUseDao duDao;
	@Override
	public void addDeviceUse(DevUse du) {
		duDao.addDeviceUse(du);

	}

}
