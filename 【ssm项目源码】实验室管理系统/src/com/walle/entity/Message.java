/**  
 * @Description:TODO:
 * @Title:  Message.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月11日 下午10:40:42   
 */
package com.walle.entity;

import java.util.Date;

public class Message {
	private String mid;
	private String eid;
	private String uphoto;
	private String uname;
	private Date mtime;
	private String mbody;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getMtime() {
		return mtime;
	}
	public void setMtime(Date mtime) {
		this.mtime = mtime;
	}
	public String getMbody() {
		return mbody;
	}
	public void setMbody(String mbody) {
		this.mbody = mbody;
	}
	@Override
	public String toString() {
		return "Message [mid=" + mid + ", eid=" + eid + ", uphoto=" + uphoto + ", uname=" + uname + ", mtime=" + mtime
				+ ", mbody=" + mbody + "]";
	}
	
}
