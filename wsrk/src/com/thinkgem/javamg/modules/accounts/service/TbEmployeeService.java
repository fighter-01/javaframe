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
import com.thinkgem.javamg.modules.accounts.entity.TbEmployee;
import com.thinkgem.javamg.modules.accounts.dao.TbAccountsScoreDao;
import com.thinkgem.javamg.modules.accounts.dao.TbEmployeeDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 部门人员基本情况表Service
 * @author wht
 * @version 2017-05-23
 */
@Service
@Transactional(readOnly = true)
public class TbEmployeeService extends CrudService<TbEmployeeDao, TbEmployee> {

	/**
	 * 持久层对象
	 */
	@Autowired
	protected TbEmployeeDao tbEmployeeDao;
	
	
	 public List<TbEmployee>  findScoreEmployeeList(TbEmployee entity){
		 
		return tbEmployeeDao.findScoreEmployeeList(entity);
	 }
	
	public TbEmployee get(String id) {
		return super.get(id);
	}
	
	public List<TbEmployee> findList(TbEmployee tbEmployee) {
		return super.findList(tbEmployee);
	}
	
	public Page<TbEmployee> findPage(Page<TbEmployee> page, TbEmployee tbEmployee) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbEmployee.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
				// 设置分页参数
		return super.findPage(page, tbEmployee);
	}
	
	@Transactional(readOnly = false)
	public void save(TbEmployee tbEmployee) {
		super.save(tbEmployee);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbEmployee tbEmployee) {
		super.delete(tbEmployee);
	}
	
}