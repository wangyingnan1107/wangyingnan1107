/**  
 * @Description:TODO:
 * @Title:  Experiment.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月7日 下午3:41:00   
 */
package com.walle.vo;

import java.util.Date;

public class ExLi {

	private String eid;//
	private String dname;//
	private String lname;
	private int dnum;
	private String ename;//
	private String edesc;//
	private Date entime;
	private Date estime;//
	private Date eetime;
	private int estate;
	private String ehelp;//
	private String msg;
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
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
	public Date getEntime() {
		return entime;
	}
	public void setEntime(Date entime) {
		this.entime = entime;
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
	public int getEstate() {
		return estate;
	}
	public void setEstate(int estate) {
		this.estate = estate;
	}
	public String getEhelp() {
		return ehelp;
	}
	public void setEhelp(String ehelp) {
		this.ehelp = ehelp;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "ExLi [eid=" + eid + ", dname=" + dname + ", lname=" + lname + ", dnum=" + dnum + ", ename=" + ename
				+ ", edesc=" + edesc + ", entime=" + entime + ", estime=" + estime + ", eetime=" + eetime + ", estate="
				+ estate + ", ehelp=" + ehelp + ", msg=" + msg + "]";
	}
	 
	
	
}
