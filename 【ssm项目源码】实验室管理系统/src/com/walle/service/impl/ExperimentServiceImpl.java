/**  
 * @Description:TODO:
 * @Title:  ExperimentServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:06:13   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.ExperimentDao;
import com.walle.entity.Experiment;
import com.walle.entity.StudentEx;
import com.walle.service.IExperimentService;
import com.walle.vo.ExEnd;
import com.walle.vo.ExLaMe;
import com.walle.vo.ExLi;

@Service
public class ExperimentServiceImpl implements IExperimentService {
	
	@Autowired
	private ExperimentDao exDao;
	@Override
	public void addExperiment(Experiment exp) {
		// TODO Auto-generated method stub
		exDao.addExperiment(exp);

	}
	@Override
	public List<ExLi> findUnExByTid(String tid) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findUnExByTid(tid);
		return els;
		
	}
	@Override
	public List<ExLi> listUnExWithSel(String tid, String ename, String estime, String eetime) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findUnExWithSel(tid,ename,estime,eetime);
		return els;
	}
	@Override
	public List<ExLi> findExByTid(String tid) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findExByTid(tid);
		return els;
	}
	@Override
	public List<ExLi> listExWithSel(String tid, String ename, String estime, String eetime) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findExWithSel(tid,ename,estime,eetime);
		return els;
	}
	@Override
	public List<ExLi> findUnHelp(String tid) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findUnHelp(tid);
		return els;
	}
	@Override
	public void changeHelp(String eid, String ehelp) {
		exDao.changeHelp(eid,ehelp);
	}
	@Override
	public List<ExLi> findSE(String tid) {
		List<ExLi> els = new ArrayList<>();
		els = exDao.findSE(tid);
		return els;
	}
	@Override
	public void changeState(String eid, String estate) {
		exDao.changeState(eid,estate);
	}
	@Override
	public List<ExLaMe> findAllStu() {
		List<ExLaMe> els = new ArrayList<>();
		els = exDao.findAllStu();
		return els;
	}
	@Override
	public ExLaMe findExMsg(String eid) {
		ExLaMe el = null;
		el = exDao.findExMsg(eid);
		return el;
	}
	@Override
	public StudentEx isYuyue(String eid, String sid) {
		StudentEx se = null;
		se = exDao.findStudentEx(eid,sid);
		return se;
	}
	@Override
	public void yuyue(StudentEx se) {
		exDao.addStudentEx(se);
		
	}
	@Override
	public List<ExLaMe> findAllStu2(String ename, String tid) {
		List<ExLaMe> els = new ArrayList<>();
		els = exDao.findAllStu2(ename,tid);
		return els;
	}
	@Override
	public List<ExEnd> findEnd(String tid) {
		List<ExEnd> ees = new ArrayList<>();
		ees = exDao.findEnd(tid);
		return ees;
		
	}

}
