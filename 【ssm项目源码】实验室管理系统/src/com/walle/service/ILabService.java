/**  
 * @Description:TODO:
 * @Title:  ILabService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年5月6日 下午4:02:52   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Lab;

public interface ILabService {

	/**
	 * 查询所有实验室
	 * @return
	 */
	public List<Lab> findAllLabs();

	/**
	 * 改变实验室状态
	 * @param lid
	 * @param lstate
	 */
	public void changeState(String lid, int lstate);

	/**
	 * 通过id删除实验室
	 * @param lid
	 */
	public void delLabById(String lid);

	/**
	 * 添加实验室
	 * @param lab
	 */
	public void addLab(Lab lab);

	/**
	 * @param lab
	 */
	public void updateLab(Lab lab);

	/**
	 * @param start
	 * @param end
	 * @return
	 */
	public List<Lab> findUnusedLab(String start, String end);
	

}
