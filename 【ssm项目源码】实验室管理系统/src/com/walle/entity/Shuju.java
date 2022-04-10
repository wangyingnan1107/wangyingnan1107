/**  
 * @Description:TODO:
 * @Title:  Shuju.java   
 * @Package com.walle.entity   
 * @author: WallE     
 * @date:   2020年5月5日 下午10:20:19   
 */
package com.walle.entity;

/**
 * @author WallE
 *
 */
public class Shuju {
	private int userNum;
	private int teacherNum;
	private int exNum;
	private int labNum;
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getTeacherNum() {
		return teacherNum;
	}
	public void setTeacherNum(int teacherNum) {
		this.teacherNum = teacherNum;
	}
	public int getExNum() {
		return exNum;
	}
	public void setExNum(int exNum) {
		this.exNum = exNum;
	}
	public int getLabNum() {
		return labNum;
	}
	public void setLabNum(int labNum) {
		this.labNum = labNum;
	}
	@Override
	public String toString() {
		return "Shuju [userNum=" + userNum + ", teacherNum=" + teacherNum + ", exNum=" + exNum + ", labNum=" + labNum
				+ "]";
	}
	/**
	 * 
	 */
	public Shuju() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param userNum
	 * @param teacherNum
	 * @param exNum
	 * @param labNum
	 */
	public Shuju(int userNum, int teacherNum, int exNum, int labNum) {
		super();
		this.userNum = userNum;
		this.teacherNum = teacherNum;
		this.exNum = exNum;
		this.labNum = labNum;
	}
	

}
