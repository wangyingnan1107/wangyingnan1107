/**  
 * @Description:TODO:
 * @Title:  ClassController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年4月28日 上午10:20:02   
 */
package com.walle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.walle.entity.Classes;
import com.walle.service.IClassService;
import com.walle.util.Log;

/**
 * @author WallE
 *
 */
@Controller
@RequestMapping("/classes")
public class ClassController {
	
	@Autowired
	private IClassService classService;
	
	@RequestMapping("/listAllClass")
	public void listAllClass(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Classes> clas = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			clas = classService.find1AllClass();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + clas.size() + ",\"data\":");
			sb.append(gs.toJson(clas));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
