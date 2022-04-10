/**  
 * @Description:TODO:
 * @Title:  MessageDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月12日 上午1:46:06   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.walle.entity.Message;

public interface MessageDao {

	/**
	 * @param ms
	 */
	@Insert("insert into tb_message(mid,eid,uphoto,uname,mtime,mbody)values(#{mid},#{eid},#{uphoto},#{uname},#{mtime},#{mbody})")
	public void addMessage(Message ms);

	/**
	 * @param eid
	 * @return
	 */
	@Select("select * from tb_message where eid=#{eid} order by mtime")
	public List<Message> findMsgByEid(@Param("eid")String eid);

}
