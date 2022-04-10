/**  
 * @Description:TODO:
 * @Title:  Admin.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年4月24日 下午2:26:36   
 */
package com.walle.entity;

/**
 * @author WallE
 *
 */
public class Admin {
	
	private String aid;//管理员id
	private String aname; //管理员姓名
	private String apwd;//管理员密码
	private String atel;//管理员电话
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	public String getAtel() {
		return atel;
	}
	public void setAtel(String atel) {
		this.atel = atel;
	}
	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", apwd=" + apwd + ", atel=" + atel + "]";
	}
	
	

}
