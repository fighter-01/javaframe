/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbEducation;
import com.thinkgem.javamg.modules.accounts.dao.TbEducationDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 廉政教育谈话情况Service
 * @author wht
 * @version 2017-06-03
 */
@Service
@Transactional(readOnly = true)
public class TbEducationService extends CrudService<TbEducationDao, TbEducation> {

	public TbEducation get(String id) {
		return super.get(id);
	}
	
	public List<TbEducation> findList(TbEducation tbEducation) {
		return super.findList(tbEducation);
	}
	
	public Page<TbEducation> findPage(Page<TbEducation> page, TbEducation tbEducation) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbEducation.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbEducation);
	}
	
	@Transactional(readOnly = false)
	public void save(TbEducation tbEducation) {
		super.save(tbEducation);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbEducation tbEducation) {
		super.delete(tbEducation);
	}
	
}