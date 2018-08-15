/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import java.util.List;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbEmployee;

/**
 * 部门人员基本情况表DAO接口
 * @author wht
 * @version 2017-05-23
 */
@MyBatisDao
public interface TbEmployeeDao extends CrudDao<TbEmployee> {
	 public List<TbEmployee>  findScoreEmployeeList(TbEmployee entity);
}