/**  
 * @Description:TODO:
 * @Title:  LabDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月6日 下午4:05:59   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.walle.entity.Lab;

public interface LabDao {

	/**
	 * @return
	 */
	@Select("select * from tb_lab where lstate>0")
	public List<Lab> findAllLabs();

	/**
	 * @param lid
	 * @param lstate
	 */
	@Update("update tb_lab set lstate=#{lstate} where lid=#{lid}")
	public void changeState(@Param("lid") String lid, @Param("lstate") int lstate);

	/**
	 * @param lid
	 */
	@Update("update tb_lab set lstate=0 where lid=#{lid}")
	public void delLabById(@Param("lid") String lid);

	/**
	 * @param lab
	 */
	@Insert("insert into tb_lab(lid,lname,lphoto,ldesc,lstate)values(#{lid},#{lname},#{lphoto},#{ldesc},#{lstate})")
	public void addLab(Lab lab);

	/**
	 * @param lab
	 */
	@Update("update tb_lab set lstate=1,lname=#{lname},ldesc=#{ldesc},lphoto=#{lphoto} where lid=#{lid}")
	public void updateLab(Lab lab);

	/**
	 * @param start
	 * @param end
	 * @return
	 */
	@Select("select * from tb_lab where lstate>0 and lid in("
			+ "select lid from tb_labuse where lustime>= DATE_FORMAT('${end}', '%Y-%m-%d %H:%T:%s') or luetime<=DATE_FORMAT('${start}', '%Y-%m-%d %H:%T:%s')) or lid not in ("
			+ "select lid from tb_labuse) and lstate=1")
	public List<Lab> findUnusedLab(@Param("start")String start, @Param("end")String end);

}
