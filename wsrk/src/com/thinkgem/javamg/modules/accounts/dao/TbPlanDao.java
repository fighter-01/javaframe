/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbPlan;

/**
 * 党风廉政建设工作计划及措施DAO接口
 * @author wht
 * @version 2017-06-01
 */
@MyBatisDao
public interface TbPlanDao extends CrudDao<TbPlan> {
	
}