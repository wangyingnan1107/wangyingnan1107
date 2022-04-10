/**  
 * @Description:TODO:
 * @Title:  NoticeDao.java   
 * @Package com.walle.dao   
 * @author: WallE     
 * @date:   2020年5月5日 上午11:41:06   
 */
package com.walle.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.walle.entity.Notice;

/**
 * @author WallE
 *
 */
@Repository
public interface NoticeDao {

	/**
	 * @param no
	 */
	@Insert("insert into tb_notice(nid,ntit,nbody,ntime,nstate) "
			+ "values(#{nid},#{ntit},#{nbody},#{ntime},#{nstate})")
	public void addNotice(Notice no);

	/**
	 * @return
	 */
	@Select("select * from tb_notice")
	public List<Notice> findAllNotices();

	/**
	 * @param nid
	 * @param nstate
	 */
	@Update("update tb_notice set nstate=#{nstate} where nid=#{nid}")
	public void updateState(@Param("nid") String nid,@Param("nstate") int nstate);

	/**
	 * @param nid
	 */
	@Delete("delete from tb_notice where nid in (${nid})")
	public void delNotices(@Param("nid")String nid);

	/**
	 * @param no
	 */
	@Update("update tb_notice set nstate=#{nstate},ntit=#{ntit},nbody=#{nbody},nstate=#{nstate},ntime=#{ntime} where nid=#{nid}")
	public void updateNotice(Notice no);

	/**
	 * @return
	 * 查询welcome.jsp中的系统公告
	 */
	@Select("select * from tb_notice where nstate=1 order by ntime")
	public List<Notice> findNotices();

}
