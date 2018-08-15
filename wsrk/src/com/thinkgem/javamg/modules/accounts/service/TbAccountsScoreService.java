/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.AllAccountsModel;
import com.thinkgem.javamg.modules.accounts.entity.TbAccountsScore;
import com.thinkgem.javamg.modules.accounts.dao.TbAccountsScoreDao;

/**
 * 台账评分Service
 * @author wht
 * @version 2017-09-01
 */
@Service
@Transactional(readOnly = true)
public class TbAccountsScoreService extends CrudService<TbAccountsScoreDao, TbAccountsScore> {
	/**
	 * 持久层对象
	 */
	@Autowired
	protected TbAccountsScoreDao tbAccountsScoreDao;
	
	public TbAccountsScore get(String id) {
		return super.get(id);
	}
	
	public List<TbAccountsScore> findList(TbAccountsScore tbAccountsScore) {
		return super.findList(tbAccountsScore);
	}
	
	public Page<TbAccountsScore> findPage(Page<TbAccountsScore> page, TbAccountsScore tbAccountsScore) {
		return super.findPage(page, tbAccountsScore);
	}
	
	@Transactional(readOnly = false)
	public void save(TbAccountsScore tbAccountsScore) {
		super.save(tbAccountsScore);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbAccountsScore tbAccountsScore) {
		super.delete(tbAccountsScore);
	}
	public List<AllAccountsModel> findAllAccountsList(AllAccountsModel allAccountsModel) {
		return tbAccountsScoreDao.findAllAccountsList(allAccountsModel);
	}
	
}