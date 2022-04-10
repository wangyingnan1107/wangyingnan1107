/**  
 * @Description:TODO:
 * @Title:  TeacherServiceImpl.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年4月27日 下午1:04:28   
 */
package com.walle.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.TeacherDao;
import com.walle.entity.Admin;
import com.walle.entity.Teacher;
import com.walle.exception.ValideNullException;
import com.walle.service.ITeacherService;
@Service
public class TeacherServiceImpl implements ITeacherService {
	
	@Autowired
	private TeacherDao teacherDao;

	@Override
	public Teacher login(Admin admin) throws ValideNullException {
		Teacher newTeacher = null;
		if(admin.getAid() == null || admin.getAid().equals("") || admin.getApwd() == null || admin.getApwd().equals("")) {
			throw new ValideNullException("用户名或密码为空");
		}
		newTeacher = teacherDao.login(admin);
		return newTeacher;
	}

	@Override
	public List<Teacher> findAllTeachers() {
		List<Teacher> teas = new ArrayList<>();
		teas = teacherDao.findAll();
		return teas;
	}

	@Override
	public List<Teacher> findTeachers(String tname) {
		List<Teacher> teas = new ArrayList<>();
		teas = teacherDao.findTeacherByName(tname);
		return teas;
	}

	@Override
	public void delTeacherByTid(String tid) {
		teacherDao.delTeacherById(tid);
		
	}

	@Override
	public void addTeacher(Teacher teacher) {
		teacherDao.addTeacher(teacher);
		
	}

	@Override
	public void updateWithoutPwdw(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherDao.updateTeacherWithOutPwd(teacher);
		
	}

	@Override
	public void updateWithPwdw(Teacher teacher) {
		// TODO Auto-generated method stub
		teacherDao.updateTeacherWithPwd(teacher);
		
	}

}
