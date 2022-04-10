/**  
 * @Description:TODO:
 * @Title:  Lab.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月6日 下午3:39:04   
 */
package com.walle.entity;
public class Lab {
	private String lid;
	private String lname;
	private String ldesc;
	private int lstate;
	private String lphoto;
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLdesc() {
		return ldesc;
	}
	public void setLdesc(String ldesc) {
		this.ldesc = ldesc;
	}
	public int getLstate() {
		return lstate;
	}
	public void setLstate(int lstate) {
		this.lstate = lstate;
	}
	public String getLphoto() {
		return lphoto;
	}
	public void setLphoto(String lphoto) {
		this.lphoto = lphoto;
	}
	@Override
	public String toString() {
		return "Lab [lid=" + lid + ", lname=" + lname + ", ldesc=" + ldesc + ", lstate=" + lstate + ", lphoto=" + lphoto
				+ "]";
	}
	
}
