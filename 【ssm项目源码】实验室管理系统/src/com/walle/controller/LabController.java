/**  
 * @Description:TODO:
 * @Title:  LabController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年5月6日 下午3:59:28   
 */
package com.walle.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.walle.entity.Lab;
import com.walle.service.ILabService;
import com.walle.util.Log;

@Controller
@RequestMapping("/lab")
public class LabController {

	@Autowired
	private ILabService labService;

	/**
	 * 查询所有实验室
	 * 
	 * @param resid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllLabs")
	public void listAllStudents(HttpServletResponse response) throws IOException {
		Log.logger.info("this is lab controller");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Lab> labs = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			labs = labService.findAllLabs();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + labs.size() + ",\"data\":");
			sb.append(gs.toJson(labs));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 查询某个时间段内空闲的实验室
	 * @param response
	 * @param request
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/listUnusedLab")
	public void listUnusedLab(HttpServletResponse response,HttpServletRequest request) throws IOException, ParseException {
		Log.logger.info("this is lab controller");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String time[] = request.getParameter("time").split(" ~ ");
		List<Lab> labs = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			labs = labService.findUnusedLab(time[0],time[1]);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + labs.size() + ",\"data\":");
			sb.append(gs.toJson(labs));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 改变实验室状态
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changeState")
	public void labUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String lid = request.getParameter("lid");
		int lstate = Integer.parseInt(request.getParameter("lstate"));

		try {
			labService.changeState(lid, lstate);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}

	/**
	 * 通过id删除实验室
	 * 
	 * @param lid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/delLab")
	public void delLab(String lid, HttpServletResponse response) throws IOException {
		Log.logger.info(lid);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			labService.delLabById(lid);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}

	/**
	 * 添加实验室
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addLab")
	public void addLab(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String lid = request.getParameter("lid");
		String lname = request.getParameter("lname");
		String lphoto = request.getParameter("lphoto");
		String ldesc = request.getParameter("ldesc");
		Lab lab = new Lab();
		lab.setLid(lid);
		lab.setLname(lname);
		lab.setLphoto(lphoto);
		lab.setLdesc(ldesc);
		lab.setLstate(1);

		try {

			labService.addLab(lab);

			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	
	@RequestMapping("/updateLab")
	public void labUpdate2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String lid = request.getParameter("lid");
		String lname = request.getParameter("lname");
		String lphoto = request.getParameter("lphoto");
		String ldesc = request.getParameter("ldesc");
		Lab lab = new Lab();
		lab.setLid(lid);
		lab.setLname(lname);
		lab.setLphoto(lphoto);
		lab.setLdesc(ldesc);
		lab.setLstate(1);
		
		try {
			labService.updateLab(lab);
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}

	/**
	 * 图片上传
	 * 
	 * @param file
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping("upload")
	public Map upload(MultipartFile file, HttpServletRequest request) {

		String prefix = "";
		String dateStr = "";
		// 保存上传
		OutputStream out = null;
		InputStream fileInput = null;
		try {
			if (file != null) {
				String originalName = file.getOriginalFilename();
				prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
				Date date = new Date();
				String uuid = UUID.randomUUID() + "";
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				dateStr = simpleDateFormat.format(date);
				String filepath = "D:\\LISM\\lab\\images\\" + dateStr + "\\" + uuid + "." + prefix;

				File files = new File(filepath);
				// 打印查看上传路径
				System.out.println(filepath);
				if (!files.getParentFile().exists()) {
					files.getParentFile().mkdirs();
				}
				file.transferTo(files);
				Map<String, Object> map2 = new HashMap<>();
				Map<String, Object> map = new HashMap<>();
				map.put("code", 0);
				map.put("msg", "");
				map.put("data", map2);
				map2.put("src", "/images/" + dateStr + "/" + uuid + "." + prefix);
				return map;
			}

		} catch (Exception e) {
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (fileInput != null) {
					fileInput.close();
				}
			} catch (IOException e) {
			}
		}
		Map<String, Object> map = new HashMap<>();
		map.put("code", 1);
		map.put("msg", "");
		return map;

	}
}
