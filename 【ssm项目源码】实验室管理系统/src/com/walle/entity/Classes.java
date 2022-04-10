/**  
 * @Description:TODO:
 * @Title:  Classes.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年4月28日 上午10:22:23   
 */
package com.walle.entity;

/**
 * @author WallE
 *
 */
public class Classes {
	private String cid;
	private String cname;
	private int cyear;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCyear() {
		return cyear;
	}
	public void setCyear(int cyear) {
		this.cyear = cyear;
	}
	@Override
	public String toString() {
		return "Classes [cid=" + cid + ", cname=" + cname + ", cyear=" + cyear + "]";
	}
	

}
