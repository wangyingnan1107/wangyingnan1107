/**  
 * @Description:TODO:
 * @Title:  Teacher.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年4月27日 下午12:58:47   
 */
package com.walle.entity;

/**
 * @author WallE
 *
 */
public class Teacher {
	private String tid;
	private String tpwd;
	private String tname;
	private String ttel;
	private String tdesc;
	private String tphoto;
	private int tstate;
	
	public int getTstate() {
		return tstate;
	}
	public void setTstate(int tstate) {
		this.tstate = tstate;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTpwd() {
		return tpwd;
	}
	public void setTpwd(String tpwd) {
		this.tpwd = tpwd;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTtel() {
		return ttel;
	}
	public void setTtel(String ttel) {
		this.ttel = ttel;
	}
	public String getTdesc() {
		return tdesc;
	}
	public void setTdesc(String tdesc) {
		this.tdesc = tdesc;
	}
	public String getTphoto() {
		return tphoto;
	}
	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}
	@Override
	public String toString() {
		return "Teacher [tid=" + tid + ", tpwd=" + tpwd + ", tname=" + tname + ", ttel=" + ttel + ", tdesc=" + tdesc
				+ ", tphoto=" + tphoto + "]";
	}
	

}
