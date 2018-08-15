/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbPlan;
import com.thinkgem.javamg.modules.accounts.dao.TbPlanDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 党风廉政建设工作计划及措施Service
 * @author wht
 * @version 2017-06-01
 */
@Service
@Transactional(readOnly = true)
public class TbPlanService extends CrudService<TbPlanDao, TbPlan> {

	public TbPlan get(String id) {
		return super.get(id);
	}
	
	public List<TbPlan> findList(TbPlan tbPlan) {
		return super.findList(tbPlan);
	}
	
	public Page<TbPlan> findPage(Page<TbPlan> page, TbPlan tbPlan) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbPlan.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
				// 设置分页参数
		return super.findPage(page, tbPlan);
	}
	
	@Transactional(readOnly = false)
	public void save(TbPlan tbPlan) {
		super.save(tbPlan);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbPlan tbPlan) {
		super.delete(tbPlan);
	}
	
}