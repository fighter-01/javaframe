/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbWorkInspect;

/**
 * 部门落实党风廉政建设责任制年度量化考评表DAO接口
 * @author wht
 * @version 2017-06-10
 */
@MyBatisDao
public interface TbWorkInspectDao extends CrudDao<TbWorkInspect> {
	
	public void updateStatus(TbWorkInspect tbWorkInspect);
	
}