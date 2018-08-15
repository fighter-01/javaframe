/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbDeptDflz;
import com.thinkgem.javamg.modules.accounts.dao.TbDeptDflzDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 部门组织的党风廉政建设活动Service
 * @author wht
 * @version 2017-06-02
 */
@Service
@Transactional(readOnly = true)
public class TbDeptDflzService extends CrudService<TbDeptDflzDao, TbDeptDflz> {

	public TbDeptDflz get(String id) {
		return super.get(id);
	}
	
	public List<TbDeptDflz> findList(TbDeptDflz tbDeptDflz) {
		return super.findList(tbDeptDflz);
	}
	
	public Page<TbDeptDflz> findPage(Page<TbDeptDflz> page, TbDeptDflz tbDeptDflz) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbDeptDflz.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbDeptDflz);
	}
	
	@Transactional(readOnly = false)
	public void save(TbDeptDflz tbDeptDflz) {
		super.save(tbDeptDflz);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbDeptDflz tbDeptDflz) {
		super.delete(tbDeptDflz);
	}
	
}