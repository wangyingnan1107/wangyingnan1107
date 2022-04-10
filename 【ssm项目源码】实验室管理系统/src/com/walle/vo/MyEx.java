/**  
 * @Description:TODO:
 * @Title:  MyEx.java   
 * @Package com.walle.vo   
 * @author: WallE     
 * @date:   2020年5月12日 下午10:31:05   
 */
package com.walle.vo;

import java.util.Date;

public class MyEx {

	private String seid;
	private String ename;
	private String lname;
	private String tname;
	private Date estime;
	private int estate;
	private String ehelp;
	private String sereport;
	private int scores;
	public String getSeid() {
		return seid;
	}
	public void setSeid(String seid) {
		this.seid = seid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Date getEstime() {
		return estime;
	}
	public void setEstime(Date estime) {
		this.estime = estime;
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
	public String getSereport() {
		return sereport;
	}
	public void setSereport(String sereport) {
		this.sereport = sereport;
	}
	public int getScores() {
		return scores;
	}
	public void setScores(int scores) {
		this.scores = scores;
	}
	@Override
	public String toString() {
		return "MyEx [seid=" + seid + ", ename=" + ename + ", lname=" + lname + ", tname=" + tname + ", estime="
				+ estime + ", estate=" + estate + ", ehelp=" + ehelp + ", sereport=" + sereport + ", scores=" + scores
				+ "]";
	}
	
	
}
