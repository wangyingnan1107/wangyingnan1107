/**  
 * @Description:TODO:
 * @Title:  ExperimentDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:07:23   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.walle.entity.Experiment;
import com.walle.entity.StudentEx;
import com.walle.vo.ExEnd;
import com.walle.vo.ExLaMe;
import com.walle.vo.ExLi;

/**
 * @author WallE
 *
 */
public interface ExperimentDao {

	/**
	 * @param exp
	 */
	@Insert("insert into tb_experiment(eid,tid,duid,luid,ename,edesc,entime,estime,eetime,estate,ehelp) "
			+ "values(#{eid},#{tid},#{duid},#{luid},#{ename},#{edesc},#{entime},#{estime},#{eetime},#{estate},#{ehelp})")
	public void addExperiment(Experiment exp);

	/**
	 * @param tid
	 * @return
	 */
	@Select("SELECT " + 
			"	e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			"WHERE e.estate in (1,2) " +
			"order by e.entime DESC")
	public List<ExLi> findUnExByTid(@Param("tid")String tid);

	/**
	 * @param tid
	 * @param ename
	 * @param entime
	 * @return
	 */
	@Select(value= {"<script>"+ 
			"SELECT e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			" <where> 1=1 and e.estate in (1,2)" +
            " <if test=\"ename != null\"> AND e.ename like #{ename}</if> " +
            " <if test=\"estime != null\" >  AND e.entime <![CDATA[ >= ]]> DATE_FORMAT('${estime}', '%Y-%m-%d %H:%T:%s')</if> " +
            " <if test=\"eetime != null\" >  AND e.entime <![CDATA[ <= ]]> DATE_FORMAT('${eetime}', '%Y-%m-%d %H:%T:%s')</if> " +
            " </where>" +
            " </script>"})
	public List<ExLi> findUnExWithSel(@Param("tid")String tid,@Param("ename") String ename, @Param("estime")String estime,@Param("eetime")String eetime);

	/**
	 * @param tid
	 * @return
	 */
	@Select("SELECT " + 
			"	e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum, " + 
			"	e.ehelp AS ehelp " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			"WHERE e.estate >2 " +
			"order by e.entime DESC")
	public List<ExLi> findExByTid(@Param("tid")String tid);

	/**
	 * @param tid
	 * @param ename
	 * @param estime
	 * @param eetime
	 * @return
	 */
	@Select(value= {"<script>"+ 
			"SELECT e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum, " + 
			"	e.ehelp AS ehelp " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			" <where> 1=1 and e.estate <![CDATA[ > ]]> 2 " +
            " <if test=\"ename != null\"> AND e.ename like #{ename}</if> " +
            " <if test=\"estime != null\" >  AND e.entime <![CDATA[ >= ]]> DATE_FORMAT('${estime}', '%Y-%m-%d %H:%T:%s')</if> " +
            " <if test=\"eetime != null\" >  AND e.entime <![CDATA[ <= ]]> DATE_FORMAT('${eetime}', '%Y-%m-%d %H:%T:%s')</if> " +
            " </where>" +
            " </script>"})
	public List<ExLi> findExWithSel(@Param("tid")String tid,@Param("ename") String ename, @Param("estime")String estime,@Param("eetime")String eetime);

	/**
	 * @param tid
	 * @return
	 */
	@Select("SELECT " + 
			"	e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum, " + 
			"	e.ehelp AS ehelp " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			"WHERE e.estate in(1,3) " +
			"order by e.entime DESC")
	public List<ExLi> findUnHelp(String tid);

	/**
	 * @param eid
	 * @param ehelp
	 */
	@Update("update tb_experiment set ehelp=#{ehelp} where eid=#{eid}")
	public void changeHelp(@Param("eid")String eid,@Param("ehelp") String ehelp);

	/**
	 * @param tid
	 * @return
	 */
	@Select("SELECT " + 
			"	e.eid AS eid, " + 
			"	e.ename AS ename, " + 
			"	e.edesc AS edesc, " + 
			"	e.entime AS entime, " + 
			"	e.estime AS estime, " + 
			"	e.eetime AS eetime, " + 
			"	e.estate AS estate, " + 
			"	l.lname AS lname, " + 
			"	d.dname AS dname, " + 
			"	du.dunum AS dnum, " + 
			"	e.ehelp AS ehelp " + 
			"FROM " + 
			"	tb_experiment e " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid) " + 
			"LEFT JOIN tb_devuse du ON (e.duid = du.duid) " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid) " + 
			"LEFT JOIN tb_device d ON (du.did = d.did) " + 
			"WHERE e.estate in(4,3) " +
			"order by e.entime DESC")
	public List<ExLi> findSE(String tid);

	/**
	 * @param eid
	 * @param estate
	 */
	@Update("update tb_experiment set estate=#{estate} where eid=#{eid}")
	public void changeState(@Param("eid")String eid,@Param("estate") String estate);

	/**
	 * @return
	 */
	@Select("SELECT  " + 
			"	e.eid AS eid,  " + 
			"	e.ename AS ename,  " + 
			"	e.edesc AS edesc,  " + 
			"	e.estime AS estime,  " + 
			"	e.eetime AS eetime,  " + 
			"	l.lname AS lname,  " + 
			"	l.lphoto AS lphoto,  " + 
			"	e.ehelp AS ehelp,  " + 
			"	t.tname AS tname,  " + 
			"	t.tphoto AS tphoto,  " + 
			"	count(m.mid) AS msgnum  " + 
			"FROM  " + 
			"	tb_experiment e  " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid)  " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid)  " + 
			"LEFT JOIN tb_message m ON (e.eid = m.eid)  " + 
			"LEFT JOIN tb_teacher t ON (e.tid = t.tid)  " + 
			"WHERE   " + 
			"e.estate = 3  " + 
			"GROUP BY  " + 
			"	e.eid  " + 
			"ORDER BY  " + 
			"	e.estime DESC")
	public List<ExLaMe> findAllStu();

	/**
	 * @param eid
	 * @return
	 */
	@Select("SELECT  " + 
			"	e.eid AS eid,  " + 
			"	e.ename AS ename,  " + 
			"	e.edesc AS edesc,  " + 
			"	e.estime AS estime,  " + 
			"	e.eetime AS eetime,  " + 
			"	l.lname AS lname,  " + 
			"	l.lphoto AS lphoto,  " + 
			"	e.ehelp AS ehelp,  " + 
			"	t.tname AS tname,  " + 
			"	t.tphoto AS tphoto,  " + 
			"	count(m.mid) AS msgnum  " + 
			"FROM  " + 
			"	tb_experiment e  " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid)  " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid)  " + 
			"LEFT JOIN tb_message m ON (e.eid = m.eid)  " + 
			"LEFT JOIN tb_teacher t ON (e.tid = t.tid)  " + 
			"WHERE   " + 
			"e.eid = #{eid}  " + 
			"GROUP BY  " + 
			"	e.eid  " + 
			"ORDER BY  " + 
			"	e.estime DESC")
	public ExLaMe findExMsg(@Param("eid")String eid);

	/**
	 * @param eid
	 * @param sid
	 * @return
	 */
	@Select("select * from tb_s_e where sno=#{sid} and eid=#{eid}")
	public StudentEx findStudentEx(@Param("eid")String eid, @Param("sid")String sid);

	/**
	 * @param eid
	 * @param sid
	 */
	@Insert("insert into tb_s_e(seid,sno,eid,sereport,scores) values(#{seid},#{sno},#{eid},#{sereport},#{scores})")
	public void addStudentEx(StudentEx se);

	/**
	 * @param ename
	 * @param tid
	 * @return
	 */
	@Select(value= {"<script>"+ 
			"SELECT  " + 
			"	e.eid AS eid,  " + 
			"	e.ename AS ename,  " + 
			"	e.edesc AS edesc,  " + 
			"	e.estime AS estime,  " + 
			"	e.eetime AS eetime,  " + 
			"	l.lname AS lname,  " + 
			"	l.lphoto AS lphoto,  " + 
			"	e.ehelp AS ehelp,  " + 
			"	t.tname AS tname,  " + 
			"	t.tphoto AS tphoto,  " + 
			"	count(m.mid) AS msgnum  " + 
			"FROM  " + 
			"	tb_experiment e  " + 
			"LEFT JOIN tb_labuse lu ON (e.luid = lu.luid)  " + 
			"LEFT JOIN tb_lab l ON (l.lid = lu.lid)  " + 
			"LEFT JOIN tb_message m ON (e.eid = m.eid)  " + 
			"LEFT JOIN tb_teacher t ON (e.tid = t.tid)  " + 
			" <where> 1=1 and e.estate =3 " +
            " <if test=\"ename != null\"> AND e.ename like #{ename}</if> " +
            " <if test=\"tid != null\" >  AND t.tid = #{tid}</if> " +
            " </where>"+ 
			"GROUP BY  " + 
			"	e.eid  " + 
			"ORDER BY  " + 
			"	e.estime DESC"+
            " </script>"})
	public List<ExLaMe> findAllStu2(@Param("ename")String ename, @Param("tid")String tid);

	/**
	 * @param tid
	 * @return
	 */
	@Select("SELECT\r\n" + 
			"	COUNT(se.seid) AS num,\r\n" + 
			"	count(nullif(se.sereport, '')) AS reportnum,\r\n" + 
			"	COUNT(se.seid) - sum(\r\n" + 
			"		CASE se.scores\r\n" + 
			"		WHEN - 1 THEN\r\n" + 
			"			1\r\n" + 
			"		ELSE\r\n" + 
			"			0\r\n" + 
			"		END\r\n" + 
			"	) AS scoresnum,\r\n" + 
			"	e.eid AS eid,\r\n" + 
			"	e.ename AS ename,\r\n" + 
			"	e.edesc AS edesc,\r\n" + 
			"	e.eetime AS eetime\r\n" + 
			"FROM\r\n" + 
			"	tb_experiment e\r\n" + 
			"LEFT JOIN tb_s_e se ON (e.eid = se.eid)\r\n" + 
			"WHERE\r\n" + 
			"	e.estate = 5\r\n" + 
			"GROUP BY\r\n" + 
			"	e.eid\r\n" + 
			"ORDER BY\r\n" + 
			"	e.eetime DESC")
	public List<ExEnd> findEnd(String tid);

}
