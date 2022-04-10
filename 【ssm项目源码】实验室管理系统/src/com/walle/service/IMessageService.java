/**  
 * @Description:TODO:
 * @Title:  IMessageService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年5月12日 上午1:43:21   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Message;

public interface IMessageService {

	/**
	 * @param ms
	 */
	public void addMessage(Message ms);

	/**
	 * @param eid
	 * @return
	 */
	public List<Message> findMsgByEid(String eid);

}
