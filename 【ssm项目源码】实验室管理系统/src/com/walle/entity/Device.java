/**  
 * @Description:TODO:
 * @Title:  Device.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月6日 下午8:26:43   
 */
package com.walle.entity;

public class Device {
	private String did;
	private String dname;
	private int dnum;
	private int dfnum;
	private String ddesc;
	private int dstate;
	
	public int getDfnum() {
		return dfnum;
	}
	public void setDfnum(int dfnum) {
		this.dfnum = dfnum;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	public String getDdesc() {
		return ddesc;
	}
	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}
	
	public int getDstate() {
		return dstate;
	}
	public void setDstate(int dstate) {
		this.dstate = dstate;
	}
	@Override
	public String toString() {
		return "Device [did=" + did + ", dname=" + dname + ", dnum=" + dnum + ",  dfnum=" + dfnum
				+ ", ddesc=" + ddesc + "]";
	}
	

}
