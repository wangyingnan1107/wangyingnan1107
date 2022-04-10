package com.walle.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.walle.entity.Message;
import com.walle.service.IMessageService;
import com.walle.util.DateUtil;
import com.walle.vo.ExLaMe;

/**  
 * @Description:TODO:
 * @Title:  MessageController.java   
 * @Package    
 * @author: WallE     
 * @date:   2020年5月12日 上午1:32:59   
 */

@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private IMessageService messageService;

	/**
	 * 发表评论
	 * @param eid
	 * @param sname
	 * @param sphoto
	 * @param mbody
	 */
	@RequestMapping("/addMessage")
	public void addMessage(String eid,String sname,String sphoto,String mbody ) {
		System.out.println(eid+"||"+sname+"||"+sphoto+"||"+mbody); 
		Message ms = new Message();
		ms.setEid(eid);
		ms.setUname(sname);
		ms.setUphoto(sphoto);
		ms.setMbody(mbody);
		ms.setMid("me"+DateUtil.getAutoIncrementKey(new Date()));
		ms.setMtime(new Date());
		try {
			messageService.addMessage(ms);
		} catch (Exception e) {
		}

	}
	
	
	@ResponseBody
	@RequestMapping("/listMsg")
	public Map listMsg(HttpServletResponse response,HttpServletRequest request) throws IOException {
		System.out.println("------------------------"+request.getParameter("eid"));
		String eid = request.getParameter("eid");
		List<Message> mes = null;
		Map<String,Object> map=new HashMap<>();
		try {
			mes = messageService.findMsgByEid(eid);
			map.put("mes", mes);
			System.out.println(mes);
		} catch (Exception e) {
		}
		return map;

	}
	
}
