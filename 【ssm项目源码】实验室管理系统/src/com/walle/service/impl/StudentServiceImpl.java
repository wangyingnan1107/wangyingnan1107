/**  
 * @Description:TODO:
 * @Title:  StudentServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年4月27日 下午1:03:34   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.StudentDao;
import com.walle.entity.Admin;
import com.walle.entity.Student;
import com.walle.exception.ValideNullException;
import com.walle.service.IStudentService;
import com.walle.vo.MyEx;
import com.walle.vo.StuSco;

/**
 * @author WallE
 *
 */
@Service
public class StudentServiceImpl implements IStudentService{

	@Autowired
	private StudentDao studentDao;
	@Override
	public Student login(Admin admin) throws ValideNullException {
		Student newStudent = null;
		if(admin.getAid() == null || admin.getAid().equals("") || admin.getApwd() == null || admin.getApwd().equals("")) {
			throw new ValideNullException("用户名或密码为空");
		}
		newStudent = studentDao.login(admin);
		return newStudent;
	}
	@Override
	public List<Student> findAllStudents() {
		List<Student> stus = new ArrayList<>();
		stus = studentDao.findAllStudents();
		
		return stus;
		
	}
	@Override
	public void updateWithoutPwdw(Student stu) {
		studentDao.updateWithoutPwd(stu);
		
	}
	@Override
	public void updateWithPwdw(Student stu) {
		studentDao.updateWithPwd(stu);
		
	}
	@Override
	public void delStudentById(String sno) {
		studentDao.delStudentById(sno);
	}
	@Override
	public List<Student> findStudents(String sno, String sname, String cid) {
		List<Student> stus = new ArrayList<>();
		stus = studentDao.findStudents(sno,sname,cid);
		
		return stus;
	}
	@Override
	public void addStudent(Student stu) {
		studentDao.addStudent(stu);
		
	}
	@Override
	public List<MyEx> myEx(String sno) {
		List<MyEx> mes = new ArrayList<>();
		mes = studentDao.myEx(sno);
		return mes;
	}
	@Override
	public void addReport(String seid, String sereport) {
		studentDao.addReport(seid,sereport);
		
	}
	@Override
	public List<StuSco> listScores(String eid) {
		List<StuSco> sss = new ArrayList<>();
		sss = studentDao.listScores(eid);
		return sss;
	}
	@Override
	public void pingfen(String seid, String sescores) {
		studentDao.pingfen(seid,sescores);
		
	}

}
