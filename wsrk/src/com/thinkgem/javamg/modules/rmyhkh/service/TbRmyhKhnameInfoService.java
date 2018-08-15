/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhkh.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.rmyhkh.entity.TbRmyhKhnameInfo;
import com.thinkgem.javamg.modules.rmyhkh.dao.TbRmyhKhnameInfoDao;

/**
 * 考核表单名列表Service
 * @author wht
 * @version 2016-09-19
 */
@Service
@Transactional(readOnly = true)
public class TbRmyhKhnameInfoService extends CrudService<TbRmyhKhnameInfoDao, TbRmyhKhnameInfo> {

	public TbRmyhKhnameInfo get(String id) {
		return super.get(id);
	}
	
	public List<TbRmyhKhnameInfo> findList(TbRmyhKhnameInfo tbRmyhKhnameInfo) {
		return super.findList(tbRmyhKhnameInfo);
	}
	
	public Page<TbRmyhKhnameInfo> findPage(Page<TbRmyhKhnameInfo> page, TbRmyhKhnameInfo tbRmyhKhnameInfo) {
		return super.findPage(page, tbRmyhKhnameInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(TbRmyhKhnameInfo tbRmyhKhnameInfo) {
		super.save(tbRmyhKhnameInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbRmyhKhnameInfo tbRmyhKhnameInfo) {
		super.delete(tbRmyhKhnameInfo);
	}
	
}