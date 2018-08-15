/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.service.TreeService;
import com.thinkgem.javamg.common.utils.StringUtils;
import com.thinkgem.javamg.modules.rmyhform.entity.TbRmyhKhformInfo;
import com.thinkgem.javamg.modules.rmyhform.dao.TbRmyhKhformInfoDao;

/**
 * 表单维护Service
 * @author wht
 * @version 2016-09-20
 */
@Service
@Transactional(readOnly = true)
public class TbRmyhKhformInfoService extends TreeService<TbRmyhKhformInfoDao, TbRmyhKhformInfo> {

	public TbRmyhKhformInfo get(String id) {
		return super.get(id);
	}
	
	public List<TbRmyhKhformInfo> findList(TbRmyhKhformInfo tbRmyhKhformInfo) {
		if (StringUtils.isNotBlank(tbRmyhKhformInfo.getParentIds())){
			tbRmyhKhformInfo.setParentIds(","+tbRmyhKhformInfo.getParentIds()+",");
		}
		return super.findList(tbRmyhKhformInfo);
	}
	
	
	
	@Transactional(readOnly = false)
	public void save(TbRmyhKhformInfo tbRmyhKhformInfo) {
		super.save(tbRmyhKhformInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbRmyhKhformInfo tbRmyhKhformInfo) {
		super.delete(tbRmyhKhformInfo);
	}
		
}