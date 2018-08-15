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
import com.thinkgem.javamg.modules.accounts.entity.TbYear;
import com.thinkgem.javamg.modules.accounts.dao.TbYearDao;
import com.thinkgem.javamg.modules.sys.entity.User;
import com.thinkgem.javamg.modules.sys.utils.UserUtils;

/**
 * 部门落实党风廉政建设责任制年度量化考评表Service
 * @author wht
 * @version 2017-06-10
 */
@Service
@Transactional(readOnly = true)
public class TbYearService extends CrudService<TbYearDao, TbYear> {

	public TbYear get(String id) {
		return super.get(id);
	}
	
	public List<TbYear> findList(TbYear tbYear) {
		return super.findList(tbYear);
	}
	
	public Page<TbYear> findPage(Page<TbYear> page, TbYear tbYear) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbYear.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		return super.findPage(page, tbYear);
	}
	
	@Transactional(readOnly = false)
	public void save(TbYear tbYear) {

		if (tbYear.getIsNewRecord()){
			tbYear.setStatus("1");
		}
		super.save(tbYear);
	}
	
	
	@Transactional(readOnly = false)
	public void updateStatus(String id,String status ,String remarks) {
		
		TbYear tbYear = new TbYear();
		tbYear.setId(id);
		tbYear.setStatus(status);
		tbYear.setRemarks(remarks);
		
		
		if(status.equals("3")){
			User user = UserUtils.getUser();
			tbYear.setDeptSign(user.getName());
			tbYear.setDeptSignTime(new Date());
		}
		if(status.equals("4")){
			User user = UserUtils.getUser();
			tbYear.setHldSign(user.getName());
			tbYear.setHldSignTime(new Date());
		}
		dao.updateStatus( tbYear);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbYear tbYear) {
		super.delete(tbYear);
	}
	
}