/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyear;

/**
 * 部门落实党风廉政建设责任制情况半年自查表DAO接口
 * @author wht
 * @version 2017-06-04
 */
@MyBatisDao
public interface TbHalfyearDao extends CrudDao<TbHalfyear> {
	
	public void updateStatus(String id ,String status);
	public void updateRemarks(String id ,String remarks,String status);
	public void updateSign(String id ,String status,String signName);
	
}