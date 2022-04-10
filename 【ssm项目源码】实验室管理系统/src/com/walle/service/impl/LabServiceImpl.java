/**  
 * @Description:TODO:
 * @Title:  LabServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月6日 下午4:04:15   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.LabDao;
import com.walle.entity.Lab;
import com.walle.service.ILabService;

@Service
public class LabServiceImpl implements ILabService {
	
	@Autowired
	private LabDao labDao;

	@Override
	public List<Lab> findAllLabs() {
		List<Lab> labs = new ArrayList<>();
		labs = labDao.findAllLabs();
		return labs;
	}

	@Override
	public void changeState(String lid, int lstate) {
		// TODO Auto-generated method stub
		labDao.changeState(lid,lstate);
		
	}

	@Override
	public void delLabById(String lid) {
		// TODO Auto-generated method stub
		labDao.delLabById(lid);
		
	}

	@Override
	public void addLab(Lab lab) {
		// TODO Auto-generated method stub
		labDao.addLab(lab);
		
	}

	@Override
	public void updateLab(Lab lab) {
		// TODO Auto-generated method stub
		labDao.updateLab(lab);
		
	}

	@Override
	public List<Lab> findUnusedLab(String  start, String end) {
		List<Lab> labs = new ArrayList<>();
		labs = labDao.findUnusedLab(start,end);
		return labs;
	}

}
