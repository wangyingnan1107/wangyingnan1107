/**  
 * @Description:TODO:
 * @Title:  Student.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年4月27日 下午12:51:20   
 */
package com.walle.entity;

/**
 * @author WallE
 *
 */
public class Student {
	private String sno;
	private String spwd;
	private String cid;
	private String sname;
	private String stel;
	private String ssex;
	private String sphoto;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSpwd() {
		return spwd;
	}
	public void setSpwd(String pwd) {
		this.spwd = pwd;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getStel() {
		return stel;
	}
	public void setStel(String stel) {
		this.stel = stel;
	}
	public String getSsex() {
		return ssex;
	}
	public void setSsex(String ssex) {
		this.ssex = ssex;
	}
	public String getSphoto() {
		return sphoto;
	}
	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}
	@Override
	public String toString() {
		return "Student [sno=" + sno + ", pwd=" + spwd + ", cid=" + cid + ", sname=" + sname + ", stel=" + stel
				+ ", ssex=" + ssex + ", sphoto=" + sphoto + "]";
	}
	
	

}
