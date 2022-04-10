/**  
 * @Description:TODO:
 * @Title:  IStudentService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年4月27日 下午12:56:12   
 */
package com.walle.service;

import java.util.List;

import com.walle.entity.Admin;
import com.walle.entity.Student;
import com.walle.exception.ValideNullException;
import com.walle.vo.MyEx;
import com.walle.vo.StuSco;

/**
 * @author WallE
 *
 */
public interface IStudentService {

	/**
	 * 学生登录
	 * @param admin
	 * @return
	 */
	public Student login(Admin admin) throws ValideNullException;

	/**
	 * 查询所有的学生
	 * @return
	 */
	public List<Student> findAllStudents();

	/**
	 * 更新学生，不更新密码
	 * @param stu
	 */
	public void updateWithoutPwdw(Student stu);

	/**
	 * 更新学生，并且更新密码
	 * @param stu
	 */
	public void updateWithPwdw(Student stu);

	/**
	 * 根据id删除学生
	 * @param sno
	 */
	public void delStudentById(String sno);

	/**
	 * 多条件查询
	 * @param sno
	 * @param sname
	 * @param cid
	 * @return
	 */
	public List<Student> findStudents(String sno, String sname, String cid);

	/**
	 * 添加学生
	 * @param stu
	 */
	public void addStudent(Student stu);

	/**
	 * 我的实验
	 * @param sno
	 * @return
	 */
	public List<MyEx> myEx(String sno);

	/**
	 * 添加实验报告
	 * @param seid
	 * @param sereport
	 */
	public void addReport(String seid, String sereport);

	/**
	 * @param eid
	 * @return
	 */
	public List<StuSco> listScores(String eid);

	/**
	 * @param seid
	 * @param sescores
	 */
	public void pingfen(String seid, String sescores);

}
