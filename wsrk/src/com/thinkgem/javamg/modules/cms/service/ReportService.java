/**
 * 
 */
package com.thinkgem.javamg.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.cms.dao.ReportDao;
import com.thinkgem.javamg.modules.cms.entity.Report;

/**
 * 举报Service
 * 
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class ReportService extends CrudService<ReportDao, Report> {

	@Transactional(readOnly = false)
	public Page<Report> findPage(Page<Report> page, Report report, boolean isDataScopeFilter) {
		return super.findPage(page, report);
	}

	@Override
	@Transactional(readOnly = false)
	public void save(Report report) {
			Report seReport= dao.get(report.getId());
			if(seReport==null){
				report.preInsert();
	    		dao.insert(report);
			}else{
				seReport.setReport_type(seReport.getReport_type()+","+report.getReport_type());
				seReport.setReport_conetent(seReport.getReport_conetent()+","+report.getReport_conetent());
				seReport.setReport_frequency(seReport.getReport_frequency()+1);
				seReport.setReport_id(seReport.getReport_id()+","+report.getReport_id());
				report.preUpdate();
	    		dao.update(seReport);
			}
	}
	
	@Transactional(readOnly = false)
	public void delete(Report report, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		//Article article = dao.get(id);
		//article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		//dao.insert(article);
		super.delete(report);
	}
	
	/**
	 * 更新索引
	 */
	public void createIndex(){
		//dao.createIndex();
	}
}
