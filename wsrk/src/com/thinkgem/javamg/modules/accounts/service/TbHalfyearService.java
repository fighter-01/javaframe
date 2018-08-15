/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.dao.TbHalfyearDao;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyear;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 部门落实党风廉政建设责任制情况半年自查表Service
 * @author wht
 * @version 2017-06-04
 */
@Service
@Transactional(readOnly = true)
public class TbHalfyearService extends CrudService<TbHalfyearDao, TbHalfyear> {

	public TbHalfyear get(String id) {
		return super.get(id);
	}
	
	public List<TbHalfyear> findList(TbHalfyear tbHalfyear) {
		return super.findList(tbHalfyear);
	}
	
	public Page<TbHalfyear> findPage(Page<TbHalfyear> page, TbHalfyear tbHalfyear) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbHalfyear.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbHalfyear);
	}
	
	@Transactional(readOnly = false)
	public void save(TbHalfyear tbHalfyear) {
		
		if (tbHalfyear.getIsNewRecord()){
			tbHalfyear.setStatus("1");
		}
		super.save(tbHalfyear);
	}
	
	@Transactional(readOnly = false)
	public void updateStatus(String id,String status) {
		
		dao.updateStatus(id, status);
	}
	@Transactional(readOnly = false)
	public void updateRemarks(String id,String remarks) {
		
		dao.updateRemarks(id, remarks,"4");
	}
	@Transactional(readOnly = false)
	public void updateSign(String id,String status,String signName) {
		
		dao.updateSign(id, status,signName);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbHalfyear tbHalfyear) {
		super.delete(tbHalfyear);
	}
	
}