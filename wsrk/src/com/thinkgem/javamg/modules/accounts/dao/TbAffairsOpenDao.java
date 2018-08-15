/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.accounts.entity.TbAffairsOpen;

/**
 * 行(政)务公开情况DAO接口
 * @author wht
 * @version 2017-06-02
 */
@MyBatisDao
public interface TbAffairsOpenDao extends CrudDao<TbAffairsOpen> {
	
}