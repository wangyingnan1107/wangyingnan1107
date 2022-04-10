/**  
 * @Description:TODO:
 * @Title:  StudentDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年4月27日 下午1:09:37   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.walle.entity.Admin;
import com.walle.entity.Student;
import com.walle.vo.MyEx;
import com.walle.vo.StuSco;

/**
 * @author WallE
 *
 */
@Repository
public interface StudentDao {

	/**
	 * @param admin
	 * @return
	 */
	@Select("select * from tb_student where sname=#{aid} and spwd=#{apwd}")
	public Student login(Admin admin);

	/**
	 * @return
	 */
	@Select("select * from tb_student")
	public List<Student> findAllStudents();

	/**
	 * @param stu
	 */
	@Update("update tb_student set sname=#{sname},cid=#{cid},stel=#{stel},"
			+ "sphoto=#{sphoto},ssex=#{ssex} "
			+ "where sno=#{sno}")
	public void updateWithoutPwd(Student stu);

	/**
	 * @param stu
	 */
	@Update("update tb_student set sname=#{sname},cid=#{cid},stel=#{stel},"
			+ "sphoto=#{sphoto},ssex=#{ssex},spwd=#{spwd} "
			+ "where sno=#{sno}")
	public void updateWithPwd(Student stu);

	/**
	 * @param sno
	 */
	@Delete("delete from tb_student where sno in (${sno})")
	public void delStudentById(@Param("sno") String sno);

	/**
	 * 加入if判断，多条件查询
	 * @param sno
	 * @param sname
	 * @param cid
	 * @return
	 */
	@Select(value = {" <script>" +
            " SELECT * FROM tb_student " +
            " <where> 1=1 " +
            " <if test=\"sno != null\"> AND sno like #{sno}</if> " +
            " <if test=\"sname != null\" >  AND sname like #{sname}</if> " +
            " <if test=\"cid != null\" >  AND cid like #{cid}</if> " +
            " </where>" +
            " </script>"})
    @Results({
            @Result(property = "sno", column = "sno"),
            @Result(property = "sname", column = "sname"),
            @Result(property = "stel", column = "stel"),
            @Result(property = "sphoto", column = "sphoto"),
            @Result(property = "spwd", column = "spwd"),
            @Result(property = "cid", column = "cid"),
            @Result(property = "ssex", column = "ssex")
    })
	public List<Student> findStudents(@Param("sno") String sno, @Param("sname") String sname, @Param("cid") String cid);

	/**
	 * 添加学生
	 * @param stu
	 */
	@Insert("insert into tb_student(sno,spwd,sname,stel,sphoto,ssex,cid)values(#{sno},#{spwd},#{sname},#{stel},#{sphoto},#{ssex},#{cid})")
	public void addStudent(Student stu);

	/**
	 * @param sno
	 * @return
	 */
	@Select("SELECT\r\n" + 
			"	se.seid AS seid,\r\n" + 
			"	e.ename AS ename,\r\n" + 
			"	l.lname AS lname,\r\n" + 
			"	t.tname AS tname,\r\n" + 
			"	e.estime AS estime,\r\n" + 
			"	e.estate AS estate,\r\n" + 
			"	e.ehelp AS ehelp,\r\n" + 
			"	se.sereport AS sereport,\r\n" + 
			"	se.scores AS scores\r\n" + 
			"FROM\r\n" + 
			"	tb_s_e se\r\n" + 
			"LEFT JOIN tb_experiment e ON (se.eid = e.eid)\r\n" + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid)\r\n" + 
			"LEFT JOIN tb_lab l ON (lu.lid = l.lid)\r\n" + 
			"LEFT JOIN tb_teacher t ON (e.tid = t.tid)\r\n" + 
			"WHERE\r\n" + 
			"	se.sno = #{sno}\r\n" + 
			"ORDER BY e.estime DESC")
	public List<MyEx> myEx(@Param("sno")String sno);

	/**
	 * @param seid
	 * @param sereport
	 */
	@Update("update tb_s_e set sereport=#{sereport} where seid=#{seid}")
	public void addReport(@Param("seid")String seid,@Param("sereport") String sereport);

	/**
	 * @param eid
	 * @return
	 */
	@Select("SELECT\r\n" + 
			"	s.sno AS sno,\r\n" + 
			"	s.sname AS sname,\r\n" + 
			"	c.cname AS cname,\r\n" + 
			"	s.sphoto AS sphoto,\r\n" + 
			"	se.sereport AS sereport,\r\n" + 
			"	se.scores AS sescores,\r\n" + 
			"	se.seid AS seid\r\n" + 
			"FROM\r\n" + 
			"	tb_s_e se,\r\n" + 
			"	tb_experiment e,\r\n" + 
			"	tb_student s,\r\n" + 
			"	tb_class c\r\n" + 
			"WHERE\r\n" + 
			"	se.eid = e.eid\r\n" + 
			"AND se.sno = s.sno\r\n" + 
			"AND s.cid = c.cid\r\n" + 
			"AND e.eid = #{eid}")
	public List<StuSco> listScores(@Param("eid")String eid);

	/**
	 * @param seid
	 * @param sescores
	 */
	@Update("update tb_s_e set scores=#{sescores} where seid=#{seid}")
	public void pingfen(@Param("seid")String seid,@Param("sescores") String sescores);

}
