/**  
 * @Description:TODO:
 * @Title:  NoticeService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年5月5日 上午11:21:46   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Notice;

public interface NoticeService {

	/**
	 * service层添加通知
	 * @param no
	 */
	public void addNotice(Notice no);

	/**
	 * service层查询所有通知
	 * @return
	 */
	public List<Notice> findAllNotices();

	/**
	 * 更新通知的状态
	 * @param nid
	 * @param nstate
	 */
	public void changeState(String nid, int nstate);

	/**
	 * 批量删除通知
	 * @param nid
	 */
	public void delNotice(String nid);

	/**
	 * 更新通知
	 * @param no
	 */
	public void updateNotice(Notice no);

	/**
	 * 查询要显示的通知
	 * @return
	 */
	public List<Notice> findNotices();

}
