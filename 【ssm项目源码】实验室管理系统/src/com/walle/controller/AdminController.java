/**  
 * @Description:TODO:
 * @Title:  AdminController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年4月24日 下午2:46:43   
 */
package com.walle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.walle.entity.Admin;
import com.walle.entity.Notice;
import com.walle.entity.Shuju;
import com.walle.entity.Student;
import com.walle.entity.Teacher;
import com.walle.exception.ValideNullException;
import com.walle.service.IAdminService;
import com.walle.service.IStudentService;
import com.walle.service.ITeacherService;
import com.walle.service.NoticeService;
import com.walle.util.Log;

/**
 * @author WallE
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private IAdminService adminService;
	@Autowired
	private IStudentService studentService;
	@Autowired
	private ITeacherService teacherService;
	@Autowired
	private NoticeService noticeService;
	/**
	 * 管理员登录
	 * @param admin
	 * @param request
	 * @return
	 */
	@RequestMapping("/adminLogin")
	public String adminLogin(Admin admin ,HttpServletRequest request) {
		String to = null;
		
		System.out.println(request.getParameter("rol"));
		String rol = request.getParameter("rol");
		
		try {
			if(rol.equals("管理员")) {
				Admin newAdmin = adminService.login(admin);
				if(newAdmin != null) {
					List<Notice> notices = noticeService.findNotices();
					request.getSession().setAttribute("notices", notices);
					request.getSession().setAttribute("admin", newAdmin);
					Log.logger.info("Controller->"+request.getSession().getAttribute("admin"));
					to = "redirect:/admin/a_index.jsp";
				}
			}else if(rol.equals("学生")) {
				Student student = studentService.login(admin);
				if(student!=null) {
					request.getSession().setAttribute("student", student);
					Log.logger.info("Controller->"+request.getSession().getAttribute("student"));
					to = "redirect:/student/s_index.jsp";
				}
			}else {
				Teacher teacher = teacherService.login(admin);
				if(teacher!=null) {
					request.getSession().setAttribute("teacher", teacher);
					Log.logger.info("Controller->"+request.getSession().getAttribute("teacher"));
					to = "redirect:/teacher/t_index.jsp";
				}
				
			}
			
		}catch (ValideNullException e) {
			request.setAttribute("msg", "用户名或密码为空");
			to = "/main/login";
		} catch (Exception e) {
			to = "error/500";
		}
		return to;
	}
	
	@RequestMapping("/shuju")
	public void adminShuju(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		Gson gs = new Gson();
		Shuju shu = new Shuju(10,100,1000,10000);
		out.print(gs.toJson(shu));
		
	}
	
}
