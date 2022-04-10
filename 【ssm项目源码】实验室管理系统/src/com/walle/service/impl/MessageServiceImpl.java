/**  
 * @Description:TODO:
 * @Title:  MessageServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年5月12日 上午1:44:59   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.MessageDao;
import com.walle.entity.Message;
import com.walle.service.IMessageService;


@Service
public class MessageServiceImpl implements IMessageService {
	@Autowired
	private MessageDao messageDao;
	@Override
	public void addMessage(Message ms) {
		messageDao.addMessage(ms);

	}
	@Override
	public List<Message> findMsgByEid(String eid) {
		List<Message> mes = new ArrayList<>();
		mes = messageDao.findMsgByEid(eid);
		return mes;
	}

}
