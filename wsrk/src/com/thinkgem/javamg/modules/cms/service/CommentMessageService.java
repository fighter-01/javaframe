/**
 * 
 */
package com.thinkgem.javamg.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.cms.dao.CommentMessageDao;
import com.thinkgem.javamg.modules.cms.entity.CommentMessage;

/**
 * 举报Service
 * 
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class CommentMessageService extends CrudService<CommentMessageDao, CommentMessage> {

	@Transactional(readOnly = false)
	public Page<CommentMessage> findPage(Page<CommentMessage> page, CommentMessage commentMessage, boolean isDataScopeFilter) {
		return super.findPage(page, commentMessage);
	}

	@Override
	@Transactional(readOnly = false)
	public void save(CommentMessage commentMessage) {
				commentMessage.preInsert();
	    		dao.insert(commentMessage);
	}
	
	@Transactional(readOnly = false)
	public void delete(CommentMessage commentMessage, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		//Article article = dao.get(id);
		//article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		//dao.insert(article);
		super.delete(commentMessage);
	}
	
	/**
	 * 更新索引
	 */
	public void createIndex(){
		//dao.createIndex();
	}
}
