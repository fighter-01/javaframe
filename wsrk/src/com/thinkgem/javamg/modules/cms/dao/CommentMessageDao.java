/**
 * 
 */
package com.thinkgem.javamg.modules.cms.dao;

import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.cms.entity.CommentMessage;

/**
 * 评论DAO接口
 * 
 * @version 2013-8-23
 */
@MyBatisDao
public interface CommentMessageDao extends CrudDao<CommentMessage> {

}
