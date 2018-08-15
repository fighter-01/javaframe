/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import java.util.List;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.AllAccountsModel;
import com.thinkgem.javamg.modules.accounts.entity.TbAccountsScore;

/**
 * 台账评分DAO接口
 * @author wht
 * @version 2017-09-01
 */
@MyBatisDao
public interface TbAccountsScoreDao extends CrudDao<TbAccountsScore> {
	
	/**
	 * 查询所有数据列表
	 * @param entity
	 * @return
	 */
	public List<AllAccountsModel> findAllAccountsList(AllAccountsModel entity);
	
}