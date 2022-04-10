/**  
 * @Description:TODO:
 * @Title:  DeviceDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月6日 下午9:57:38   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.walle.entity.Device;

@Repository
public interface DeviceDao {

	/**
	 * @return
	 */
	@Select("select * from tb_device where dstate>0")
	public List<Device> findAll();

	/**
	 * @param dname
	 * @return
	 */
	@Select("select * from tb_device where dstate>0 and dname like #{dname}")
	public List<Device> findByName(@Param("dname")String dname);

	/**
	 * 
	 */
	@Insert("insert into tb_device(did,dname,ddesc,dnum,dfnum,dstate) "
			+ "values(#{did},#{dname},#{ddesc},#{dnum},#{dfnum},#{dstate})")
	public void addDevice(Device de);

	/**
	 * @param start
	 * @param end
	 * @return
	 */
	@Select("SELECT CASE WHEN d.dnum-SUM(u.dunum) IS NULL THEN d.dnum " + 
			"ELSE d.dnum-SUM(u.dunum) END " + 
			"AS dnum,d.dname AS dname ,d.ddesc as ddesc,d.dstate as dstate ,d.did AS did,d.dfnum AS dfnum " +
			"from tb_device d  " + 
			"LEFT JOIN tb_devuse u " + 
			"on d.did=u.did AND " +
			"dustime>= DATE_FORMAT('${start}', '%Y-%m-%d %H:%T:%s') AND " +
			"duetime<= DATE_FORMAT('${end}', '%Y-%m-%d %H:%T:%s') AND " +
			"d.dstate>0 " + 
			"GROUP BY(d.did)")
	public List<Device> findUnusedDevice(@Param("start")String start, @Param("end")String end);

}
