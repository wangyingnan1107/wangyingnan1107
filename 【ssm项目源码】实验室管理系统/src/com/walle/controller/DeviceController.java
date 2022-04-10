/**  
 * @Description:TODO:
 * @Title:  DeviceController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年5月6日 下午9:52:58   
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
import com.walle.entity.Device;
import com.walle.service.IDeviceService;
import com.walle.util.DateUtil;
import com.walle.util.Log;

@Controller
@RequestMapping("/device")
public class DeviceController {
	@Autowired
	private IDeviceService deviceService;
	/**
	 * 查询所有设备
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllDevice")
	public void listAllDevice(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Device> des = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			des = deviceService.findAllTeachers();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + des.size() + ",\"data\":");
			sb.append(gs.toJson(des));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping("/listUnusedDevice")
	public void listUnusedDevice(HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Device> des = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		String time[] = request.getParameter("time").split(" ~ ");
		System.out.println(time[0]+"~"+time[1]);
		try {

			des = deviceService.findUnusedDevice(time[0],time[1]);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + des.size() + ",\"data\":");
			sb.append(gs.toJson(des));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	/**
	 * 通过名字查找设备
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listDevice")
	public void listDevice(HttpServletRequest request,HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String dname = request.getParameter("dname");
		dname = dname==null||dname.equals("")?"%%":"%"+dname+"%";
		List<Device> des = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			des = deviceService.findTeachersByName(dname);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + des.size() + ",\"data\":");
			sb.append(gs.toJson(des));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 添加设备
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addDevice")
	public void addDevice(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String dname = request.getParameter("dname");
		String ddesc = request.getParameter("ddesc");
		int dnum = Integer.parseInt(request.getParameter("dnum"));
		Device de = new Device();
		
		de.setDid("d-" + DateUtil.getAutoIncrementKey(new Date()));
		de.setDdesc(ddesc);
		de.setDname(dname);
		de.setDnum(dnum);
		de.setDstate(1);
		de.setDfnum(0);
		Log.logger.info(de);
		try {
			deviceService.addDevice(de);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}

}
