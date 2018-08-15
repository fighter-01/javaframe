/**
 * 
 */
package com.thinkgem.javamg.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.cms.dao.RssSourceDao;
import com.thinkgem.javamg.modules.cms.entity.RSSSource;

/**
 * 推送Service
 * 
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class RssSourceService extends CrudService<RssSourceDao, RSSSource> {

	@Transactional(readOnly = false)
	public Page<RSSSource> findPage(Page<RSSSource> page, RSSSource rssSource, boolean isDataScopeFilter) {
		return super.findPage(page, rssSource);
	}

	@Override
	@Transactional(readOnly = false)
	public void save(RSSSource rssSource) {
			rssSource.preUpdate();
    		dao.insert(rssSource);
	}
	
	@Transactional(readOnly = false)
	public void delete(RSSSource rssSource, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		//Article article = dao.get(id);
		//article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		//dao.insert(article);
		super.delete(rssSource);
	}
	
	/**
	 * 更新索引
	 */
	public void createIndex(){
		//dao.createIndex();
	}
}
