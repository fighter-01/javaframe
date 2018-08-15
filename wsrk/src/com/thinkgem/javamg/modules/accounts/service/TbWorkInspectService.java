/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbWorkInspect;
import com.thinkgem.javamg.modules.accounts.dao.TbWorkInspectDao;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门落实党风廉政建设责任制年度量化考评表Service
 * @author wht
 * @version 2017-06-10
 */
@Service
@Transactional(readOnly = true)
public class TbWorkInspectService extends CrudService<TbWorkInspectDao, TbWorkInspect> {

	public TbWorkInspect get(String id) {
		return super.get(id);
	}
	
	public List<TbWorkInspect> findList(TbWorkInspect tbWorkInspect) {
		return super.findList(tbWorkInspect);
	}
	
	public Page<TbWorkInspect> findPage(Page<TbWorkInspect> page, TbWorkInspect tbWorkInspect) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbWorkInspect.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbWorkInspect);
	}
	
	@Transactional(readOnly = false)
	public void save(TbWorkInspect tbWorkInspect) {

		if (tbWorkInspect.getIsNewRecord()){
			tbWorkInspect.setStatus("1");
		}
		super.save(tbWorkInspect);
	}
	
	
	@Transactional(readOnly = false)
	public void updateStatus(String id,String status ,String remarks) {
		
		TbWorkInspect tbWorkInspect = new TbWorkInspect();
		tbWorkInspect.setId(id);
		tbWorkInspect.setStatus(status);
		tbWorkInspect.setRemarks(remarks);
		
		
		if(status.equals("3")){
			User user = UserUtils.getUser();
			tbWorkInspect.setDeptSign(user.getName());
			tbWorkInspect.setDeptSignTime(new Date());
		}
		if(status.equals("4")){
			User user = UserUtils.getUser();
			tbWorkInspect.setHldSign(user.getName());
			tbWorkInspect.setHldSignTime(new Date());
		}
		dao.updateStatus( tbWorkInspect);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbWorkInspect tbWorkInspect) {
		super.delete(tbWorkInspect);
	}
	
}