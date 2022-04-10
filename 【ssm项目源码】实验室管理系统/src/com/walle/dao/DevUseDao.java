/**  
 * @Description:TODO:
 * @Title:  DevUseDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:20:32   
 */
package com.walle.dao;

import org.apache.ibatis.annotations.Insert;

import com.walle.entity.DevUse;

/**
 * @author WallE
 *
 */
public interface DevUseDao {

	/**
	 * @param d
	 */
	@Insert("insert into tb_devuse(duid,did,tname,dustime,duetime,dustate,dunum) "
			+ "values(#{duid},#{did},#{tname},#{dustime},#{duetime},#{dustate},#{dunum})")
	public void addDeviceUse(DevUse du);

}
