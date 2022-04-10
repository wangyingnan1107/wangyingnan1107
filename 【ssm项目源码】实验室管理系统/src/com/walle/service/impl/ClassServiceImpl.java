/**  
 * @Description:TODO:
 * @Title:  ClassServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年4月28日 上午10:25:49   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.ClassDao;
import com.walle.entity.Classes;
import com.walle.service.IClassService;

/**
 * @author WallE
 *
 */
@Service
public class ClassServiceImpl implements IClassService {
	
	@Autowired
	private ClassDao classDao;

	@Override
	public List<Classes> find1AllClass() {
		List<Classes> clas = new ArrayList<>();
		clas = classDao.findAllClass();
		return clas;
	}

}
