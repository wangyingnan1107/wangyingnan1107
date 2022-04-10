/**  
 * @Description:TODO:
 * @Title:  LabUse.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月7日 下午4:52:08   
 */
package com.walle.entity;

import java.util.Date;

public class LabUse {

	private String luid;
	private int lustate;
	private String lid;
	private String tname;
	private Date lustime;
	private Date luetime;
	
	public int getLustate() {
		return lustate;
	}
	public void setLustate(int lustate) {
		this.lustate = lustate;
	}
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLuid() {
		return luid;
	}
	public void setLuid(String luid) {
		this.luid = luid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Date getLustime() {
		return lustime;
	}
	public void setLustime(Date lustime) {
		this.lustime = lustime;
	}
	public Date getLuetime() {
		return luetime;
	}
	public void setLuetime(Date luetime) {
		this.luetime = luetime;
	}
	@Override
	public String toString() {
		return "LabUse [luid=" + luid + ", lustate=" + lustate + ", lid=" + lid + ", tname=" + tname + ", lustime="
				+ lustime + ", luetime=" + luetime + "]";
	}
	 
	
	
}
