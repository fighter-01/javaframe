/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;
import com.thinkgem.javamg.modules.rmyhform.dao.TbRmyhFileDao;

/**
 * 考核文件Service
 * @author wht
 * @version 2016-10-08
 */
@Service
@Transactional(readOnly = true)
public class TbRmyhFileService extends CrudService<TbRmyhFileDao, TbRmyhFile> {

	
	public TbRmyhFile get(String id) {
		TbRmyhFile tbRmyhFile = super.get(id);
		return tbRmyhFile;
	}
	
	public List<TbRmyhFile> findList(TbRmyhFile tbRmyhFile) {
		return super.findList(tbRmyhFile);
	}
	
	public Page<TbRmyhFile> findPage(Page<TbRmyhFile> page, TbRmyhFile tbRmyhFile) {
		return super.findPage(page, tbRmyhFile);
	}
	//得到考核文件一级审核完成列表
	public Page<TbRmyhFile> findOnePage(Page<TbRmyhFile> page, TbRmyhFile tbRmyhFile) {
		tbRmyhFile.setPage(page);
		page.setList(dao.findLisOne(tbRmyhFile));
		return page;
	}

	//得到考核资料上报中已上报列表
		public Page<TbRmyhFile> findOnePage1(Page<TbRmyhFile> page, TbRmyhFile tbRmyhFile) {
			tbRmyhFile.setPage(page);
			page.setList(dao.findLisOne1(tbRmyhFile));
			return page;
		}
	
	public Page<TbRmyhFile> findSHPage(Page<TbRmyhFile> page, TbRmyhFile tbRmyhFile) {
		tbRmyhFile.setPage(page);
		page.setList(dao.findListSH(tbRmyhFile));
		return page;
	}
	@Transactional(readOnly = false)
	public void save(TbRmyhFile tbRmyhFile) {
		super.save(tbRmyhFile);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbRmyhFile tbRmyhFile) {
		super.delete(tbRmyhFile);
	}
	
}