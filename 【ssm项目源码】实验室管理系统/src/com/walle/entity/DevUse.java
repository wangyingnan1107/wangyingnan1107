/**  
 * @Description:TODO:
 * @Title:  DevUse.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月8日 下午5:12:59   
 */
package com.walle.entity;

import java.util.Date;

public class DevUse {

	private String duid;
	private String did;
	private String tname;
	private Date dustime;
	private Date duetime;
	private int dustate;
	private int dunum;
	public String getDuid() {
		return duid;
	}
	public void setDuid(String duid) {
		this.duid = duid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Date getDustime() {
		return dustime;
	}
	public void setDustime(Date dustimel) {
		this.dustime = dustimel;
	}
	public Date getDuetime() {
		return duetime;
	}
	public void setDuetime(Date duetime) {
		this.duetime = duetime;
	}
	public int getDustate() {
		return dustate;
	}
	public void setDustate(int dustate) {
		this.dustate = dustate;
	}
	public int getDunum() {
		return dunum;
	}
	public void setDunum(int dunum) {
		this.dunum = dunum;
	}
	@Override
	public String toString() {
		return "DevUse [duid=" + duid + ", did=" + did + ", tname=" + tname + ", dustimel=" + dustime + ", duetime="
				+ duetime + ", dustate=" + dustate + ", dunum=" + dunum + "]";
	}
	
}
