/**  
 * @Description:TODO:
 * @Title:  ClassDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年4月28日 上午10:27:20   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.walle.entity.Classes;

/**
 * @author WallE
 *
 */
public interface ClassDao {

	/**
	 * @return
	 */
	@Select("select * from tb_class")
	public List<Classes> findAllClass();

}
