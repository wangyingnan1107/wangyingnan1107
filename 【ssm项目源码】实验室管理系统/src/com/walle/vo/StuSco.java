/**  
 * @Description:TODO:
 * @Title:  StuSco.java   
 * @Package com.walle.vo   
 * @author: WallE     
 * @date:   2020年5月13日 下午4:55:28   
 */
package com.walle.vo;


public class StuSco {
	private String sno;
	private String sname;
	private String cname;
	private String sphoto;
	private String sereport;
	private int sescores;
	private String seid;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSphoto() {
		return sphoto;
	}
	public void setSphoto(String sphoto) {
		this.sphoto = sphoto;
	}
	public String getSereport() {
		return sereport;
	}
	public void setSereport(String sereport) {
		this.sereport = sereport;
	}
	public int getSescores() {
		return sescores;
	}
	public void setSescores(int sescores) {
		this.sescores = sescores;
	}
	public String getSeid() {
		return seid;
	}
	public void setSeid(String seid) {
		this.seid = seid;
	}
	@Override
	public String toString() {
		return "StuSco [sno=" + sno + ", sname=" + sname + ", cname=" + cname + ", sphoto=" + sphoto + ", sereport="
				+ sereport + ", sescores=" + sescores + ", seid=" + seid + "]";
	}
	
}
