/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbHalfyearTable;
import com.thinkgem.javamg.modules.accounts.dao.TbHalfyearTableDao;

/**
 * 半年自查表维护Service
 * @author wht
 * @version 2017-10-21
 */
@Service
@Transactional(readOnly = true)
public class TbHalfyearTableService extends CrudService<TbHalfyearTableDao, TbHalfyearTable> {

	public TbHalfyearTable get(String id) {
		return super.get(id);
	}
	
	public List<TbHalfyearTable> findList(TbHalfyearTable tbHalfyearTable) {
		return super.findList(tbHalfyearTable);
	}
	
	public Page<TbHalfyearTable> findPage(Page<TbHalfyearTable> page, TbHalfyearTable tbHalfyearTable) {
		return super.findPage(page, tbHalfyearTable);
	}
	
	@Transactional(readOnly = false)
	public void save(TbHalfyearTable tbHalfyearTable) {
		super.save(tbHalfyearTable);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbHalfyearTable tbHalfyearTable) {
		super.delete(tbHalfyearTable);
	}
	
}