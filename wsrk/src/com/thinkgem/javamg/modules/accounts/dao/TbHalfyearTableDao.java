/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyearTable;

/**
 * 半年自查表维护DAO接口
 * @author wht
 * @version 2017-10-21
 */
@MyBatisDao
public interface TbHalfyearTableDao extends CrudDao<TbHalfyearTable> {
	
}