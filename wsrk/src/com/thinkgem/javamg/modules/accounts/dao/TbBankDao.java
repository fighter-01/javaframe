/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbBank;

/**
 * 个人有关金融事项报告表DAO接口
 * @author wht
 * @version 2017-09-26
 */
@MyBatisDao
public interface TbBankDao extends CrudDao<TbBank> {
	
}