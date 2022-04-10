/**  
 * @Description:TODO:
 * @Title:  ExEnd.java   
 * @Package com.walle.vo   
 * @author: WallE     
 * @date:   2020年5月13日 下午12:02:49   
 */
package com.walle.vo;

import java.util.Date;

public class ExEnd {
	private String eid;
	private String ename;
	private String edesc;
	private Date eetime;
	private int reportnum;
	private int scoresnum;
	private int num;
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
	public Date getEetime() {
		return eetime;
	}
	public void setEetime(Date eetime) {
		this.eetime = eetime;
	}
	public int getReportnum() {
		return reportnum;
	}
	public void setReportnum(int reportnum) {
		this.reportnum = reportnum;
	}
	public int getScoresnum() {
		return scoresnum;
	}
	public void setScoresnum(int scoresnum) {
		this.scoresnum = scoresnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "ExEnd [eid=" + eid + ", ename=" + ename + ", edesc=" + edesc + ", eetime=" + eetime + ", reportnum="
				+ reportnum + ", scoresnum=" + scoresnum + ", num=" + num + "]";
	}
	
	

}
