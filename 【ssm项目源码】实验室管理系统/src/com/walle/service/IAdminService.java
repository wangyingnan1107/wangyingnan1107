/**  
 * @Description:TODO:
 * @Title:  IAdminService.java   
 * @Package com.walle.service   
 * @author: WallE     
 * @date:   2020年4月24日 下午2:48:33   
 */
package com.walle.service;

import com.walle.entity.Admin;
import com.walle.exception.ValideNullException;

/**
 * @author WallE
 *
 */
public interface IAdminService {

	/**
	 * servicec层管理员登录
	 * @param admin
	 * @return
	 */
	public Admin login(Admin admin)throws ValideNullException;

}
