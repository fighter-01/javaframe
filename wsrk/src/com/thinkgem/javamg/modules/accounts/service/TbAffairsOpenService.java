/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbAffairsOpen;
import com.thinkgem.javamg.modules.accounts.dao.TbAffairsOpenDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 行(政)务公开情况Service
 * @author wht
 * @version 2017-06-02
 */
@Service
@Transactional(readOnly = true)
public class TbAffairsOpenService extends CrudService<TbAffairsOpenDao, TbAffairsOpen> {

	public TbAffairsOpen get(String id) {
		return super.get(id);
	}
	
	public List<TbAffairsOpen> findList(TbAffairsOpen tbAffairsOpen) {
		
		return super.findList(tbAffairsOpen);
	}
	
	public Page<TbAffairsOpen> findPage(Page<TbAffairsOpen> page, TbAffairsOpen tbAffairsOpen) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbAffairsOpen.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbAffairsOpen);
	}
	
	@Transactional(readOnly = false)
	public void save(TbAffairsOpen tbAffairsOpen) {
		super.save(tbAffairsOpen);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbAffairsOpen tbAffairsOpen) {
		super.delete(tbAffairsOpen);
	}
	
}