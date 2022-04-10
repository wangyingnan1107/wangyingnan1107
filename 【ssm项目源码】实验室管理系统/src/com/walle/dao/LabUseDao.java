/**  
 * @Description:TODO:
 * @Title:  LabUseDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月8日 下午6:15:42   
 */
package com.walle.dao;

import org.apache.ibatis.annotations.Insert;

import com.walle.entity.LabUse;

/**
 * @author WallE
 *
 */
public interface LabUseDao {

	/**
	 * @param lu
	 */
	@Insert("insert into tb_labuse(luid,lid,tname,lustime,luetime,lustate) "
			+ "values(#{luid},#{lid},#{tname},#{lustime},#{luetime},#{lustate})")
	public void addLabUse(LabUse lu);
	

}
