/**  
 * @Description:TODO:
 * @Title:  NoticeController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年5月5日 上午11:17:30   
 */
package com.walle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.walle.entity.Notice;
import com.walle.service.NoticeService;
import com.walle.util.DateUtil;
import com.walle.util.Log;

/**
 * @author WallE
 *
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	/**
	 * 添加通知
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addNotice")
	public void addNotice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String ntit = request.getParameter("ntit");
		String nbody = request.getParameter("nbody");
		Notice no = new Notice();
		no.setNid("no-" + DateUtil.getAutoIncrementKey(new Date()));
		no.setNtit(ntit);
		no.setNbody(nbody);
		no.setNstate(1);
		no.setNtime(new Date());
		Log.logger.info(no);
		try {
			noticeService.addNotice(no);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}

	/**
	 * 查询所有通知
	 * 
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllNotice")
	public void listAllNotices(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Notice> nos = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			nos = noticeService.findAllNotices();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + nos.size() + ",\"data\":");
			sb.append(gs.toJson(nos));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 改变通知状态
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changeState")
	public void noticeUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String nid = request.getParameter("nid");
		int nstate = request.getParameter("nstate").equals("true") ? 1 : 0;

		try {
			noticeService.changeState(nid, nstate);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	/**
	 * 删除通知
	 * @param nid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/delNotice")
	public void delNotice(String nid, HttpServletResponse response) throws IOException {
		Log.logger.info(nid);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			noticeService.delNotice(nid);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	
	@RequestMapping("/update")
	public void noticeUpdate2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String nid = request.getParameter("nid");
		String ntit = request.getParameter("ntit");
		String nbody = request.getParameter("nbody");
		Notice no = new Notice();
		no.setNid(nid);
		no.setNtit(ntit);
		no.setNbody(nbody);
		no.setNstate(1);
		no.setNtime(new Date());
		
		try {
			
			noticeService.updateNotice(no);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}

}
