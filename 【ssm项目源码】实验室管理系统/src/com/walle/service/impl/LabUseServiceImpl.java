/**  
 * @Description:TODO:
 * @Title:  LabUseServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:14:28   
 */
package com.walle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.LabUseDao;
import com.walle.entity.LabUse;
import com.walle.service.ILabUseService;

@Service
public class LabUseServiceImpl implements ILabUseService {

	@Autowired
	private LabUseDao luDao;
	@Override
	public void addLabUse(LabUse lu) {
		luDao.addLabUse(lu);

	}

}
