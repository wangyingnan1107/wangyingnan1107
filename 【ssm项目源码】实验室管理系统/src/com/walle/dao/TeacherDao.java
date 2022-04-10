/**  
 * @Description:TODO:
 * @Title:  TeacherDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年4月27日 下午1:07:17   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.walle.entity.Admin;
import com.walle.entity.Teacher;
public interface TeacherDao {

	/**
	 * 老师登录
	 * @param admin
	 * @return
	 */
	@Select("select * from tb_teacher where tname=#{aid} and tpwd=#{apwd} and tstate=1")
	public Teacher login(Admin admin);
	
	/**
	 * @return
	 */
	@Select("select * from tb_teacher where tstate=1")
	public List<Teacher> findAll();

	/**
	 * @param tname
	 * @return
	 */
	@Select(value = {" <script>" +
            " SELECT * FROM tb_teacher " +
            " <where> 1=1 and tstate=1" +
            " <if test=\"tname != null\" >  AND tname like #{tname}</if> " +
            " </where>" +
            " </script>"})
    @Results({
            @Result(property = "tid", column = "tid"),
            @Result(property = "tname", column = "tname"),
            @Result(property = "ttel", column = "ttel"),
            @Result(property = "tphoto", column = "tphoto"),
            @Result(property = "tpwd", column = "tpwd"),
            @Result(property = "tdesc", column = "tdesc")
    })
	public List<Teacher> findTeacherByName(@Param("tname")String tname);

	/**
	 * 删除教师，只是更改状态，而不是直接删除
	 * @param tid
	 */
	@Update("update tb_teacher set tstate=0 where tid in (${tid})")
	public void delTeacherById(@Param("tid")String tid);

	/**
	 * 添加教师
	 * @param teacher
	 */
	@Insert("insert into tb_teacher(tid,tpwd,tname,ttel,tphoto,tdesc,tstate)values(#{tid},#{tpwd},#{tname},#{ttel},#{tphoto},#{tdesc},#{tstate})")
	public void addTeacher(Teacher teacher);

	/**
	 * @param teacher
	 */
	@Update("update tb_teacher set tname=#{tname},tdesc=#{tdesc},ttel=#{ttel},"
			+ "tphoto=#{tphoto},tstate=#{tstate} "
			+ "where tid=#{tid}")
	public void updateTeacherWithOutPwd(Teacher teacher);

	/**
	 * @param teacher
	 */
	@Update("update tb_teacher set tname=#{tname},tdesc=#{tdesc},ttel=#{ttel},"
			+ "tphoto=#{tphoto},tstate=#{tstate},tpwd=#{tpwd} "
			+ "where tid=#{tid}")
	public void updateTeacherWithPwd(Teacher teacher);

}
