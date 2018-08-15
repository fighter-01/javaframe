/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbSupervision;
import com.thinkgem.javamg.modules.accounts.dao.TbSupervisionDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 接受监督情况Service
 * @author wht
 * @version 2017-06-03
 */
@Service
@Transactional(readOnly = true)
public class TbSupervisionService extends CrudService<TbSupervisionDao, TbSupervision> {

	public TbSupervision get(String id) {
		return super.get(id);
	}
	
	public List<TbSupervision> findList(TbSupervision tbSupervision) {
		return super.findList(tbSupervision);
	}
	
	public Page<TbSupervision> findPage(Page<TbSupervision> page, TbSupervision tbSupervision) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbSupervision.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbSupervision);
	}
	
	@Transactional(readOnly = false)
	public void save(TbSupervision tbSupervision) {
		super.save(tbSupervision);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbSupervision tbSupervision) {
		super.delete(tbSupervision);
	}
	
}