/**  
 * @Description:TODO:
 * @Title:  NoticeServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月5日 上午11:36:41   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.NoticeDao;
import com.walle.entity.Notice;
import com.walle.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void addNotice(Notice no) {
		noticeDao.addNotice(no);

	}

	@Override
	public List<Notice> findAllNotices() {
		
		List<Notice> nos = new ArrayList<>();
		nos = noticeDao.findAllNotices();
		return nos;
	}

	@Override
	public void changeState(String nid, int nstate) {
		noticeDao.updateState(nid,nstate);
		
	}

	@Override
	public void delNotice(String nid) {
		noticeDao.delNotices(nid);
		
	}

	@Override
	public void updateNotice(Notice no) {
		noticeDao.updateNotice(no);
		
	}

	@Override
	public List<Notice> findNotices() {
		List<Notice> nos = new ArrayList<>();
		nos = noticeDao.findNotices();
		return nos;
	}

}
