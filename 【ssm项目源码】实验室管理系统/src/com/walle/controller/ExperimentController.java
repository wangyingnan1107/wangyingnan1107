/**  
 * @Description:TODO:
 * @Title:  ExperimentController.java   
 * @Package com.walle.controller   
 * @author: WallE     
 * @date:   2020年5月8日 下午5:59:46   
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
import com.walle.entity.DevUse;
import com.walle.entity.Experiment;
import com.walle.entity.LabUse;
import com.walle.entity.StudentEx;
import com.walle.service.IDevUseService;
import com.walle.service.IExperimentService;
import com.walle.service.ILabUseService;
import com.walle.util.DateUtil;
import com.walle.util.Log;
import com.walle.vo.ExEnd;
import com.walle.vo.ExLaMe;
import com.walle.vo.ExLi;

@Controller
@RequestMapping("/experiment")
public class ExperimentController {
	@Autowired
	private IExperimentService exService;
	@Autowired
	private ILabUseService luService;
	@Autowired
	private IDevUseService duService;
	
	
	/**
	 * 报告评分，已结束实验
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listEnd")
	public void listEnd(String tid,HttpServletResponse response) throws IOException {
		System.out.println("||||"+tid);
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExEnd> ees = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {
			ees = exService.findEnd(tid);
			//els = exService.findUnExByTid(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + ees.size() + ",\"data\":");
			sb.append(gs.toJson(ees));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 学生端查询预约实验(条件查询)
	 * @param ename
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listExSel")
	public void listExSel(String ename,String tid,HttpServletResponse response) throws IOException {
		System.out.println(ename+"||||"+tid);
		ename = ename == null || ename.equals("") ? null : "%" + ename + "%";
		tid = tid == null || tid.equals("") ? null : tid;
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLaMe> elms = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {
			elms = exService.findAllStu2(ename,tid);
			//els = exService.findUnExByTid(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + elms.size() + ",\"data\":");
			sb.append(gs.toJson(elms));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 学生端查询预约实验
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listAllEx")
	public void listAllEx(HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLaMe> elms = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {
			elms = exService.findAllStu();
			//els = exService.findUnExByTid(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + elms.size() + ",\"data\":");
			sb.append(gs.toJson(elms));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 判断实验是否预约
	 * @param eid
	 * @param sid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/isYuyue")
	public void isYuyue(String eid,String sid, HttpServletResponse response) throws IOException {
		Log.logger.info(eid+"||||"+sid);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			StudentEx se = null;
			se = exService.isYuyue(eid,sid);
			//studentService.delStudentById(sno);
			//exService.changeHelp(eid,sid);
			if(se==null) {
				System.out.println("为空");
				msg = 1;
			}else
				System.out.println("不为空");
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	/**
	 * 实验预约
	 * @param eid
	 * @param sid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/yuyue")
	public void yuyue(String eid,String sid, HttpServletResponse response) throws IOException {
		Log.logger.info(eid+"||||"+sid);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			StudentEx se = new StudentEx();
			se.setEid(eid);
			se.setSno(sid);
			se.setSeid("se"+DateUtil.getAutoIncrementKey(new Date()));
			exService.yuyue(se);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	
	
	
	/**
	 * 实验详情
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("/exmsg")
	public Map exmsg(HttpServletResponse response,HttpServletRequest request) throws IOException {
		System.out.println("------------------------"+request.getParameter("eid"));
		String eid = request.getParameter("eid");
		ExLaMe el = null;
		Map<String,Object> map=new HashMap<>();
		try {
			el = exService.findExMsg(eid);
			map.put("el", el);
			System.out.println(el);
		} catch (Exception e) {
		}
		return map;

	}
	/**
	 * 学生首页查询
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/homeList")
	public void homeList(HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		List<ExLaMe> els = null;
		try {
			els = exService.findAllStu();
			request.getSession().setAttribute("els", els);
			System.out.println(els);
		} catch (Exception e) {
		}

	}
	
	/**
	 * 数据库更新文档
	 * @param eid
	 * @param ehelp
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changeHelp")
	public void changeHelp(String eid,String ehelp, HttpServletResponse response) throws IOException {
		Log.logger.info(eid+"||||"+ehelp);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			//studentService.delStudentById(sno);
			exService.changeHelp(eid,ehelp);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	/**
	 * 更新试验记录的状态
	 * @param eid
	 * @param estate
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changeState")
	public void changeState(String eid,String estate, HttpServletResponse response) throws IOException {
		Log.logger.info(eid+"||||"+estate);
		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			//studentService.delStudentById(sno);
			exService.changeState(eid,estate);
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
    @RequestMapping("upload")
    public Map upload(MultipartFile file,HttpServletRequest request){
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
                String filepath = "D:\\LISM\\experiment\\help\\" + dateStr+"\\"+uuid+"." + prefix;


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
                map2.put("src","/help/"+ dateStr+"/"+uuid+"." + prefix);
                map2.put("eid", eid);
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
	 * 实验申请 1.添加试验记录 2.添加实验室使用记录，状态为1，待审核 3.添加设备使用记录，状态为1，待审核
	 * 
	 * @param response
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/apply")
	public void apply(HttpServletResponse response, HttpServletRequest request) throws IOException, ParseException {
		String did = request.getParameter("did2");
		int dnum = Integer.parseInt(request.getParameter("dnum2"));
		String edesc = request.getParameter("edesc2");
		String ename = request.getParameter("ename2");
		String etime[] = request.getParameter("etime2").split(" ~ ");
		String lid = request.getParameter("lid2");
		String tid = request.getParameter("tid2");
		String tname = request.getParameter("tname2");
		SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start = sdm.parse(etime[0]);
		Date end = sdm.parse(etime[1]);
		Date now = new Date();

		LabUse lu = new LabUse();
		lu.setLuid("lu" + DateUtil.getAutoIncrementKey(now));
		lu.setLid(lid);
		lu.setLuetime(end);
		lu.setLustate(1);
		lu.setLustime(start);
		lu.setTname(tname);

		DevUse du = new DevUse();
		du.setDuid("du" + DateUtil.getAutoIncrementKey(now));
		du.setDid(did);
		du.setDuetime(end);
		du.setDunum(dnum);
		du.setDustate(1);
		du.setDustime(start);
		du.setTname(tname);

		Experiment exp = new Experiment();
		exp.setEid("ex" + DateUtil.getAutoIncrementKey(now));
		exp.setEdesc(edesc);
		exp.setEetime(end);
		exp.setEname(ename);
		exp.setEstate(1);
		exp.setEstime(start);
		exp.setTid(tid);
		exp.setEntime(now);
		exp.setDuid(du.getDuid());
		exp.setLuid(lu.getLuid());
		System.out.println(exp);
		System.out.println(du);
		System.out.println(lu);

		PrintWriter out = response.getWriter();
		int msg = 0;
		try {
			exService.addExperiment(exp);
			luService.addLabUse(lu);
			if (did != null && !did.equals(""))
				duService.addDeviceUse(du);

			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}
	
	/**
	 * 
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listUnEx")
	public void listUnEx(String tid, HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.findUnExByTid(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 多条件查询试验记录
	 * @param tid
	 * @param ename
	 * @param entime
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listUnExWithSel")
	public void listUnExWithSel(String tid, String ename, String entime, HttpServletResponse response)
			throws IOException {
		System.out.println(tid + "||" + ename + "||" + entime);
		ename = ename == null || ename.equals("") ? null : "%" + ename + "%";
		entime = entime == null || entime.equals("") ? null : entime;
		String estime = null;
		String eetime = null;
		if (entime != null) {
			String time[] = entime.split(" ~ ");
			estime = time[0];
			entime = time[1];

		}
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.listUnExWithSel(tid, ename, estime, eetime);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	/**
	 * 根据教师id查询试验记录
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listEx")
	public void listEx(String tid, HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.findExByTid(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/listExWithSel")
	public void listExWithSel(String tid, String ename, String entime, HttpServletResponse response)
			throws IOException {
		System.out.println(tid + "||" + ename + "||" + entime);
		ename = ename == null || ename.equals("") ? null : "%" + ename + "%";
		entime = entime == null || entime.equals("") ? null : entime;
		String estime = null;
		String eetime = null;
		if (entime != null) {
			String time[] = entime.split(" ~ ");
			estime = time[0];
			entime = time[1];

		}
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.listExWithSel(tid, ename, estime, eetime);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 查询帮助
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listHelp")
	public void listHelp(String tid, HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.findUnHelp(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 查询可开始结束
	 * @param tid
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listSE")
	public void listSE(String tid, HttpServletResponse response) throws IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		List<ExLi> els = null;
		StringBuilder sb = new StringBuilder();
		Gson gs = new Gson();
		try {

			els = exService.findSE(tid);
			sb.append("{\"code\":0,\"msg\":\"\",\"count\":" + els.size() + ",\"data\":");
			sb.append(gs.toJson(els));
			sb.append("}");
			Log.logger.info(sb.toString());
			out.print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

}
