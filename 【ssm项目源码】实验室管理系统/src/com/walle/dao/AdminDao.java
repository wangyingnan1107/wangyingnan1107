/**  
 * @Description:TODO:
 * @Title:  AdminDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年4月24日 下午4:11:46   
 */
package com.walle.dao;

import org.apache.ibatis.annotations.Select;

import com.walle.entity.Admin;

/**
 * @author WallE
 *
 */
public interface AdminDao {

	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	@Select("select * from tb_admin where aname=#{aid} and apwd=#{apwd}")
	public Admin login(Admin admin);

}
