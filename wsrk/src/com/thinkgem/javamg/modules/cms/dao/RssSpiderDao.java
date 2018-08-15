/**
 * 
 */
package com.thinkgem.javamg.modules.cms.dao;


import com.thinkgem.javamg.common.persistence.CrudDao;
import com.thinkgem.javamg.common.persistence.annotation.MyBatisDao;
import com.thinkgem.javamg.modules.cms.entity.RSSSpider;

/**
 * 推送DAO接口
 * @version 2013-8-23
 */
@MyBatisDao
public interface RssSpiderDao extends CrudDao<RSSSpider> {
	
}
