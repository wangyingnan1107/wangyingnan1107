/**  
 * @Description:TODO:
 * @Title:  Experiment.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月7日 下午3:41:00   
 */
package com.walle.entity;

import java.util.Date;

public class Experiment {

	private String eid;
	private String tid;
	private String duid;
	private String luid;
	private String ename;
	private String edesc;
	private Date entime;
	private Date estime;
	private Date eetime;
	private int estate;
	private String ehelp;
	
	public String getDuid() {
		return duid;
	}
	public void setDuid(String duid) {
		this.duid = duid;
	}
	public String getLuid() {
		return luid;
	}
	public void setLuid(String luid) {
		this.luid = luid;
	}
	public Date getEntime() {
		return entime;
	}
	public void setEntime(Date entime) {
		this.entime = entime;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
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
	@Override
	public String toString() {
		return "Experiment [eid=" + eid + ", tid=" + tid + ", duid=" + duid + ", luid=" + luid + ", ename=" + ename
				+ ", edesc=" + edesc + ", entime=" + entime + ", estime=" + estime + ", eetime=" + eetime + ", estate="
				+ estate + ", ehelp=" + ehelp + "]";
	}
	
	
}
