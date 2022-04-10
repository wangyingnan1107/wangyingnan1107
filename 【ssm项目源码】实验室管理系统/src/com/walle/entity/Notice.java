/**  
 * @Description:TODO:
 * @Title:  Notice.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月5日 上午11:14:31   
 */
package com.walle.entity;

import java.util.Date;

/**
 * @author WallE
 *
 */
public class Notice {
	private String nid;
	private String ntit;
	private String nbody;
	private Date ntime;
	private int nstate;
	public String getNid() {
		return nid;
	}
	public void setNid(String nid) {
		this.nid = nid;
	}
	public String getNtit() {
		return ntit;
	}
	public void setNtit(String ntit) {
		this.ntit = ntit;
	}
	public String getNbody() {
		return nbody;
	}
	public void setNbody(String nbody) {
		this.nbody = nbody;
	}
	public Date getNtime() {
		return ntime;
	}
	public void setNtime(Date ntime) {
		this.ntime = ntime;
	}
	public int getNstate() {
		return nstate;
	}
	public void setNstate(int nstate) {
		this.nstate = nstate;
	}
	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", ntit=" + ntit + ", nbody=" + nbody + ", ntime=" + ntime + ", nstate=" + nstate
				+ "]";
	}

}
