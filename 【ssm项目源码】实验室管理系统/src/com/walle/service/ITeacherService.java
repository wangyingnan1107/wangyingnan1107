/**  
 * @Description:TODO:
 * @Title:  ITeacherService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年4月27日 下午1:01:28   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Admin;
import com.walle.entity.Teacher;
import com.walle.exception.ValideNullException;
public interface ITeacherService {

	/**
	 * 教师登录
	 * @param admin
	 * @return
	 */
	public Teacher login(Admin admin) throws ValideNullException;

	/**
	 * 查询所有教师
	 * @return
	 */
	public List<Teacher> findAllTeachers();

	/**
	 * 通过姓名查找教师
	 * @param tname
	 * @return
	 */
	public List<Teacher> findTeachers(String tname);

	/**
	 * 通过id删除教师
	 * @param tid
	 */
	public void delTeacherByTid(String tid);

	/**
	 * 添加教师
	 * @param teacher
	 */
	public void addTeacher(Teacher teacher);

	/**
	 * 修改教师，不修改密码
	 * @param teacher
	 */
	public void updateWithoutPwdw(Teacher teacher);

	/**
	 * 修改教师，并初始化密码
	 * @param teacher
	 */
	public void updateWithPwdw(Teacher teacher);

}
