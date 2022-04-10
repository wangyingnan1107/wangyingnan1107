/**  
 * @Description:TODO:
 * @Title:  TeacherController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年5月6日 上午9:24:20   
 */
package com.walle.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
import com.walle.entity.DevUse;
import com.walle.entity.Experiment;
import com.walle.entity.LabUse;
import com.walle.entity.Teacher;
import com.walle.service.ITeacherService;
import com.walle.util.DateUtil;
import com.walle.util.Log;


@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	private ITeacherService teacherService;
	
	/**
	 * 查询所有教师
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllTeacher")
	public void listAllSTeachers(HttpServletResponse response) throws IOException {
		Log.logger.info("This is Controller......");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Teacher> tes = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			tes = teacherService.findAllTeachers();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + tes.size() + ",\"data\":");
			sb.append(gs.toJson(tes));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 通过姓名查找教师
	 * @param response
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping("/listTeacher")
	public void listTeacher(HttpServletResponse response,HttpServletRequest request) throws IOException {
		

		String tname = request.getParameter("tname");
		tname = tname==null||tname.equals("")?null:"%"+tname+"%";
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Teacher> teas = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			teas = teacherService.findTeachers(tname);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + teas.size() + ",\"data\":");
			sb.append(gs.toJson(teas));
			sb.append("}");
			Log.logger.info("|||||"+sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 删除教师
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/delTeacher")
	public void delTeacher(String tid, HttpServletResponse response) throws IOException {
		Log.logger.info(tid);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			teacherService.delTeacherByTid(tid);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	/**
	 * 添加教师
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addTeacher")
	public void addTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String tid = request.getParameter("tid");
		String tpwd = request.getParameter("tpwd");
		String tname = request.getParameter("tname");
		String ttel = request.getParameter("ttel");
		String tphoto = request.getParameter("tphoto");
		String tdesc = request.getParameter("tdesc");
		Teacher teacher = new Teacher();
		teacher.setTid(tid);
		teacher.setTname(tname);
		teacher.setTtel(ttel);
		teacher.setTdesc(tdesc);
		teacher.setTphoto(tphoto);
		teacher.setTpwd(tid);
		teacher.setTstate(1);
		
		try {
			
			teacherService.addTeacher(teacher);
			
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	/**
	 * 更新教师
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/update")
	public void teacherUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String tid = request.getParameter("tid");
		String tname = request.getParameter("tname");
		String ttel = request.getParameter("ttel");
		String tphoto = request.getParameter("tphoto");
		String tdesc = request.getParameter("tdesc");
		String tpwd = request.getParameter("tpwd");
		Teacher teacher = new Teacher();
		teacher.setTid(tid);
		teacher.setTname(tname);
		teacher.setTtel(ttel);
		teacher.setTdesc(tdesc);
		teacher.setTphoto(tphoto);
		teacher.setTstate(1);
		
		try {
			if(tpwd.equals("不重置")) {
				teacherService.updateWithoutPwdw(teacher);
			}else {
				teacher.setTpwd(tid);
				teacherService.updateWithPwdw(teacher);
			}
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	
	/**
	 * 图片上传
	 * @param file
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
    @RequestMapping("upload")
    public Map upload(MultipartFile file,HttpServletRequest request){

        String prefix="";
        String dateStr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                Date date = new Date();
                String uuid = UUID.randomUUID()+"";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\LISM\\teacher\\images\\" + dateStr+"\\"+uuid+"." + prefix;


                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String,Object> map2=new HashMap<>();
                Map<String,Object> map=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                map.put("data",map2);
                map2.put("src","/images/"+ dateStr+"/"+uuid+"." + prefix);
                return map;
            }

        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map;

    }

}
