/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.accounts.entity.TbOfficeDflz;
import com.thinkgem.javamg.modules.accounts.dao.TbOfficeDflzDao;
import com.thinkgem.javamg.modules.sys.entity.User;

/**
 * 参加机关党风廉政建设活动情况Service
 * @author wht
 * @version 2017-06-02
 */
@Service
@Transactional(readOnly = true)
public class TbOfficeDflzService extends CrudService<TbOfficeDflzDao, TbOfficeDflz> {

	public TbOfficeDflz get(String id) {
		return super.get(id);
	}
	
	public List<TbOfficeDflz> findList(TbOfficeDflz tbOfficeDflz) {
		return super.findList(tbOfficeDflz);
	}
	
	public Page<TbOfficeDflz> findPage(Page<TbOfficeDflz> page, TbOfficeDflz tbOfficeDflz) {
		User user = new User();
		// 生成数据权限过滤条件(dsf为dataScopeFilter的简写，在xml中使用 ${sqlMap.dsf}调用权限SQL)
		tbOfficeDflz.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
				// 设置分页参数
		return super.findPage(page, tbOfficeDflz);
	}
	
	@Transactional(readOnly = false)
	public void save(TbOfficeDflz tbOfficeDflz) {
		super.save(tbOfficeDflz);
	}
	
	@Transactional(readOnly = false)
	public void delete(TbOfficeDflz tbOfficeDflz) {
		super.delete(tbOfficeDflz);
	}
	
}