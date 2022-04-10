/**  
 * @Description:TODO:
 * @Title:  StudentEx.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月12日 下午3:48:33   
 */
package com.walle.entity;

public class StudentEx {
	private String seid;
	private String sno;
	private String eid;
	private String sereport;
	private int scores;
	public String getSeid() {
		return seid;
	}
	public void setSeid(String seid) {
		this.seid = seid;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
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
		return "StudentEx [seid=" + seid + ", sno=" + sno + ", eid=" + eid + ", sereport=" + sereport + ", scores="
				+ scores + "]";
	}
	

}
