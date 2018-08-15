/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKf;
import com.thinkgem.javamg.modules.rmyhform.dao.TbRmyhKfDao;

/**
 * 扣分及扣分原因Service
 * @author wht
 * @version 2016-10-15
 */
@Service
@Transactional(readOnly = true)
public class TbRmyhKfService extends CrudService<TbRmyhKfDao, TbRmyhKf> {

	public TbRmyhKf get(String id) {
		return super.get(id);
	}
	
	public List<TbRmyhKf> findList(TbRmyhKf tbRmyhKf) {
		return super.findList(tbRmyhKf);
	}
	
	public Page<TbRmyhKf> findPage(Page<TbRmyhKf> page, TbRmyhKf tbRmyhKf) {
		return super.findPage(page, tbRmyhKf);
	}
	
	@Transactional(readOnly = false)
	public void save(TbRmyhKf tbRmyhKf) {
		super.save(tbRmyhKf);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbRmyhKf tbRmyhKf) {
		super.delete(tbRmyhKf);
	}
	
}