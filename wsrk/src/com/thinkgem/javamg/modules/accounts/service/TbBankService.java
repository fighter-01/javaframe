/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbBank;
import com.thinkgem.javamg.modules.accounts.dao.TbBankDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 个人有关金融事项报告表Service
 * @author wht
 * @version 2017-09-26
 */
@Service
@Transactional(readOnly = true)
public class TbBankService extends CrudService<TbBankDao, TbBank> {

	public TbBank get(String id) {
		return super.get(id);
	}
	
	public List<TbBank> findList(TbBank tbBank) {
		return super.findList(tbBank);
	}
	
	public Page<TbBank> findPage(Page<TbBank> page, TbBank tbBank) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbBank.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbBank);
	}
	
	@Transactional(readOnly = false)
	public void save(TbBank tbBank) {
		super.save(tbBank);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbBank tbBank) {
		super.delete(tbBank);
	}
	
}