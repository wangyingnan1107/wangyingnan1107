/**  
 * @Description:TODO:
 * @Title:  StudentController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年4月27日 下午4:04:43   
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
import com.walle.entity.Student;
import com.walle.service.IStudentService;
import com.walle.util.Log;
import com.walle.vo.MyEx;
import com.walle.vo.StuSco;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private IStudentService studentService;
	
	
	@RequestMapping("/pingfen")
	public void pingfen(String seid,String sescores, HttpServletResponse response) throws IOException {
		Log.logger.info(seid+"||||"+sescores);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			//studentService.delStudentById(sno);
			studentService.pingfen(seid,sescores);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	
	
	/**
	 * 为选择某实验的学生打分
	 * @param eid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listScores")
	public void listScores(String eid,HttpServletResponse response) throws IOException {
		System.out.println(eid);
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<StuSco> sss = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			sss = studentService.listScores(eid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + sss.size() + ",\"data\":");
			sb.append(gs.toJson(sss));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 更新实验报告
	 * @param seid
	 * @param sereport
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addReport")
	public void addReport(String seid,String sereport, HttpServletResponse response) throws IOException {
		Log.logger.info(seid+"||||"+sereport);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			//studentService.delStudentById(sno);
			studentService.addReport(seid,sereport);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	/**
	 * 上传文档
	 * @param file
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
    @RequestMapping("uploadReport")
    public Map uploadReport(MultipartFile file,HttpServletRequest request){
		System.out.println("开始上传");
		String eid = request.getParameter("id");
		System.out.println(request.getParameter("id"));
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
                String filepath = "D:\\LISM\\student\\report\\" + dateStr+"\\"+uuid+"." + prefix;


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
                map2.put("src","/report/"+ dateStr+"/"+uuid+"." + prefix);
                map2.put("seid", eid);
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
	
	/**
	 * 我的实验
	 * @param sno
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/myEx")
	public void myEx(String sno,HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<MyEx> mes = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			mes = studentService.myEx(sno);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + mes.size() + ",\"data\":");
			sb.append(gs.toJson(mes));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 查询所有学生
	 * @param resid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllStudent")
	public void listAllStudents(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Student> stus = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			stus = studentService.findAllStudents();
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + stus.size() + ",\"data\":");
			sb.append(gs.toJson(stus));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 通过条件查询学生
	 * @param resid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listStudent")
	public void listStudents(HttpServletResponse response,HttpServletRequest request) throws IOException {
		

		String sno = request.getParameter("sno");
		String sname = request.getParameter("sname");
		String cid = request.getParameter("cid");
		sno = sno==null||sno.equals("")?null:"%"+sno+"%";
		sname = sname==null||sname.equals("")?null:"%"+sname+"%";
		cid = cid==null||cid.equals("")?null:cid;
		
		
		if(sno!=null) {
			System.out.println("不是空的："+sno);
		}
		
		
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Student> stus = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			stus = studentService.findStudents(sno,sname,cid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + stus.size() + ",\"data\":");
			sb.append(gs.toJson(stus));
			sb.append("}");
			Log.logger.info("|||||"+sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
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
		System.out.println("开始上传");
		System.out.println(request.getParameter("id"));
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
                String filepath = "D:\\LISM\\student\\images\\" + dateStr+"\\"+uuid+"." + prefix;


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
	/**
	 * 更新学生
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/update")
	public void studentUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String sno = request.getParameter("sno");
		String cid = request.getParameter("cid");
		String sname = request.getParameter("sname");
		String stel = request.getParameter("stel");
		String sphoto = request.getParameter("sphoto");
		String ssex = request.getParameter("ssex");
		String spwd = request.getParameter("spwd");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setCid(cid);
		stu.setSname(sname);
		stu.setSphoto(sphoto);
		stu.setSsex(ssex);
		stu.setStel(stel);
		
		try {
			if(spwd.equals("不重置")) {
				studentService.updateWithoutPwdw(stu);
			}else {
				stu.setSpwd(sno);
				studentService.updateWithPwdw(stu);
			}
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	/**
	 * 删除学生，通过学号
	 * @param sno
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/delStudent")
	public void delStudent(String sno, HttpServletResponse response) throws IOException {
		Log.logger.info(sno);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			studentService.delStudentById(sno);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	
	/**
	 * 添加学生
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addStudent")
	public void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String sno = request.getParameter("sno");
		String cid = request.getParameter("cid");
		String sname = request.getParameter("sname");
		String stel = request.getParameter("stel");
		String sphoto = request.getParameter("sphoto");
		String ssex = request.getParameter("ssex");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setCid(cid);
		stu.setSname(sname);
		stu.setSphoto(sphoto);
		stu.setSsex(ssex);
		stu.setStel(stel);
		
		try {
			
			studentService.addStudent(stu);
			
			out.print("1");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			out.print("0");
		}
	}
	
	/**
	 * 批量添加学生
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addManyStudent")
	public void addStudents(HttpServletRequest request, HttpServletResponse response) throws IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		System.out.println("laila ");
		System.out.println(request.getParameter("data"));
//		String sno = request.getParameter("sno");
//		String cid = request.getParameter("cid");
//		String sname = request.getParameter("sname");
//		String stel = request.getParameter("stel");
//		String sphoto = request.getParameter("sphoto");
//		String ssex = request.getParameter("ssex");
//		String spwd = request.getParameter("spwd");
//		Student stu = new Student();
//		stu.setSno(sno);
//		stu.setCid(cid);
//		stu.setSname(sname);
//		stu.setSphoto(sphoto);
//		stu.setSsex(ssex);
//		stu.setStel(stel);
//		
//		try {
//			
//			studentService.addStudent(stu);
//			
//			out.print("1");
//		} catch (Exception e) {
//			Log.logger.error(e.getMessage(), e);
//			out.print("0");
//		}
	}
	

}
