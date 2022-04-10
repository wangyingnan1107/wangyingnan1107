/**  
 * @Description:TODO:
 * @Title:  IExperimentService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:02:06   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Experiment;
import com.walle.entity.StudentEx;
import com.walle.vo.ExEnd;
import com.walle.vo.ExLaMe;
import com.walle.vo.ExLi;

public interface IExperimentService {

	/**
	 * @param exp
	 */
	public void addExperiment(Experiment exp);

	/**
	 * @param tid
	 * @return
	 */
	public List<ExLi> findUnExByTid(String tid);

	/**
	 * @param tid
	 * @param ename
	 * @param entime
	 * @return
	 */
	public List<ExLi> listUnExWithSel(String tid, String ename, String estime,String eetime);

	/**
	 * @param tid
	 * @return
	 */
	public List<ExLi> findExByTid(String tid);

	/**
	 * @param tid
	 * @param ename
	 * @param estime
	 * @param eetime
	 * @return
	 */
	public List<ExLi> listExWithSel(String tid, String ename, String estime, String eetime);

	/**
	 * @param tid
	 * @return
	 */
	public List<ExLi> findUnHelp(String tid);

	/**
	 * @param eid
	 * @param ehelp
	 */
	public void changeHelp(String eid, String ehelp);

	/**
	 * @param tid
	 * @return
	 */
	public List<ExLi> findSE(String tid);

	/**
	 * @param eid
	 * @param estate
	 */
	public void changeState(String eid, String estate);

	/**
	 * @return
	 */
	public List<ExLaMe> findAllStu();

	/**
	 * @param eid
	 * @return
	 */
	public ExLaMe findExMsg(String eid);

	/**
	 * @param eid
	 * @param sid
	 * @return
	 */
	public StudentEx isYuyue(String eid, String sid);

	/**
	 * @param eid
	 * @param sid
	 */
	public void yuyue(StudentEx se);

	/**
	 * @param ename
	 * @param tid
	 * @return
	 */
	public List<ExLaMe> findAllStu2(String ename, String tid);

	/**
	 * @param tid
	 * @return
	 */
	public List<ExEnd> findEnd(String tid);

}
