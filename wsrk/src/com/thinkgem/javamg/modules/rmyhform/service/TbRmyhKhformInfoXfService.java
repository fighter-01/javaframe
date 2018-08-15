/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.common.service.TreeService;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhFile;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.dao.TbRmyhFileDao;
import com.thinkgem.javamg.modules.rmyhform.dao.TbRmyhKhformInfoXfDao;

/**
 * 下发的表结构Service
 * @author wht
 * @version 2016-10-18
 */
@Service
@Transactional(readOnly = true)				
public class TbRmyhKhformInfoXfService extends CrudService<TbRmyhKhformInfoXfDao, TbRmyhKhformInfo> {

	public TbRmyhKhformInfo get(String id) {
		return super.get(id);
	}
	
	public List<TbRmyhKhformInfo> findList(TbRmyhKhformInfo tbRmyhKhformInfoXf) {
		if (StringUtils.isNotBlank(tbRmyhKhformInfoXf.getParentIds())){
			tbRmyhKhformInfoXf.setParentIds(","+tbRmyhKhformInfoXf.getParentIds()+",");
		}
		return super.findList(tbRmyhKhformInfoXf);
	}
	
	@Transactional(readOnly = false)
	public void save(TbRmyhKhformInfo tbRmyhKhformInfoXf) {
		super.save(tbRmyhKhformInfoXf);
		
	}
	
	@Transactional(readOnly = false)
	public void delete(TbRmyhKhformInfo tbRmyhKhformInfoXf) {
		super.delete(tbRmyhKhformInfoXf);
	}
	
}