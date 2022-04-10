/**  
 * @Description:TODO:
 * @Title:  ExLaMe.java   
 * @Package com.walle.vo   
 * @author: WallE     
 * @date:   2020年5月11日 下午10:10:17   
 */
package com.walle.vo;

import java.util.Date;

public class ExLaMe {
	private String eid;
	private String ename;
	private String edesc;
	private Date estime;
	private Date eetime;
	private String ehelp;
	private String lname;
	private String lphoto;
	private String tname;
	private String tphoto;
	private int msgnum;
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEdesc() {
		return edesc;
	}
	public void setEdesc(String edesc) {
		this.edesc = edesc;
	}
	public Date getEstime() {
		return estime;
	}
	public void setEstime(Date estime) {
		this.estime = estime;
	}
	public Date getEetime() {
		return eetime;
	}
	public void setEetime(Date eetime) {
		this.eetime = eetime;
	}
	public String getEhelp() {
		return ehelp;
	}
	public void setEhelp(String ehelp) {
		this.ehelp = ehelp;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLphoto() {
		return lphoto;
	}
	public void setLphoto(String lphoto) {
		this.lphoto = lphoto;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTphoto() {
		return tphoto;
	}
	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}
	public int getMsgnum() {
		return msgnum;
	}
	public void setMsgnum(int msgnum) {
		this.msgnum = msgnum;
	}
	@Override
	public String toString() {
		return "ExLaMe [eid=" + eid + ", ename=" + ename + ", edesc=" + edesc + ", estime=" + estime + ", eetime="
				+ eetime + ", ehelp=" + ehelp + ", lname=" + lname + ", lphoto=" + lphoto + ", tname=" + tname
				+ ", tphoto=" + tphoto + ", msgnum=" + msgnum + "]";
	}
	

}
