/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.dao;

import java.util.List;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;

/**
 * 考核文件DAO接口
 * @author wht
 * @version 2016-10-08
 */
@MyBatisDao
public interface TbRmyhFileDao extends CrudDao<TbRmyhFile> {
	
	/**
	 * 查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
	 * @param entity
	 * @return
	 */
	public List<TbRmyhFile> findListSH(TbRmyhFile entity);
	//获取一级审核完成列表
	public List<TbRmyhFile> findLisOne(TbRmyhFile entity);
	public List<TbRmyhFile> findLisOne1(TbRmyhFile entity);
	
}