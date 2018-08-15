/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbSupervision;

/**
 * 接受监督情况DAO接口
 * @author wht
 * @version 2017-06-03
 */
@MyBatisDao
public interface TbSupervisionDao extends CrudDao<TbSupervision> {
	
}