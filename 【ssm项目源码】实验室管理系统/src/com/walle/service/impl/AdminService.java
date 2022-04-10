/**  
 * @Description:TODO:
 * @Title:  AdminService.java   
 * @Package com.walle.service.impl   
 * @author: WallE     
 * @date:   2020年4月24日 下午4:07:48   
 */
package com.walle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walle.dao.AdminDao;
import com.walle.entity.Admin;
import com.walle.exception.ValideNullException;
import com.walle.service.IAdminService;

/**
 * @author WallE
 *
 */
@Service
public class AdminService implements IAdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin login(Admin admin) throws ValideNullException {
		Admin newAdmin = null;
		if(admin.getAid() == null || admin.getAid().equals("") || admin.getApwd() == null || admin.getApwd().equals("")) {
			throw new ValideNullException("用户名或密码为空");
		}
		newAdmin = adminDao.login(admin);
		
		return newAdmin;
	}

}
