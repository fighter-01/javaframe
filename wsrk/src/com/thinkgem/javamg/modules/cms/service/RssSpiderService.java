/**
 * 
 */
package com.thinkgem.javamg.modules.cms.service;

import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;












import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.thinkgem.javamg.common.persistence.Page;
import com.thinkgem.javamg.common.service.CrudService;
import com.thinkgem.javamg.modules.cms.dao.RssSpiderDao;
import com.thinkgem.javamg.modules.cms.entity.RSSSource;
import com.thinkgem.javamg.modules.cms.entity.RSSSpider;

/**
 * 推送Service
 * 
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class RssSpiderService extends CrudService<RssSpiderDao, RSSSpider> {

	@Transactional(readOnly = false)
	public Page<RSSSpider> findPage(Page<RSSSpider> page, RSSSpider rssSpider, boolean isDataScopeFilter) {
		return super.findPage(page, rssSpider);
	}

	@Override
	@Transactional(readOnly = false)
	public void save(RSSSpider rssSpider) {
			rssSpider.preUpdate();
    		dao.insert(rssSpider);
	}
	
	@Transactional(readOnly = false)
	public void delete(RSSSpider rssSpider, Boolean isRe) {
//		dao.updateDelFlag(id, isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		//Article article = dao.get(id);
		//article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		//dao.insert(article);
		super.delete(rssSpider);
	}
	
	@Transactional(readOnly = false)
	public void getNews(RSSSource rssSource, Boolean isRe) {
		

        
        String rss = rssSource.getRssUrl();
        try {
            URL url = new URL(rss);
            // 读取Rss源   
            XmlReader reader = new XmlReader(url);
            
            System.out.println("Rss源的编码格式为：" + reader.getEncoding());
            SyndFeedInput input = new SyndFeedInput();
            // 得到SyndFeed对象，即得到Rss源里的所有信息   
            SyndFeed feed = input.build(reader);
            //System.out.println(feed);
            // 得到Rss新闻中子项列表   
            List entries = feed.getEntries();
            // 循环得到每个子项信息   
            for (int i = 0; i < entries.size(); i++) {
            	RSSSpider spider = new RSSSpider();
            	spider.setRss(rssSource.getId());
                SyndEntry entry = (SyndEntry) entries.get(i);
                // 标题、连接地址、标题简介、时间是一个Rss源项最基本的组成部分   
                spider.setTitle(entry.getTitle());
                spider.setUrl(entry.getLink());
                SyndContent description = entry.getDescription();
                spider.setRssAbstract(description.getValue());
                spider.setPubliserTime(entry.getPublishedDate());
//                List categoryList = entry.getCategories();
//                if (categoryList != null) {
//                    for (int m = 0; m < categoryList.size(); m++) {
//                        SyndCategory category = (SyndCategory) categoryList.get(m);
//                        System.out.println("此标题所属的范畴：" + category.getName());
//                    }
//                }
//                // 得到流媒体播放文件的信息列表   
//                List enclosureList = entry.getEnclosures();
//                if (enclosureList != null) {
//                    for (int n = 0; n < enclosureList.size(); n++) {
//                        SyndEnclosure enclosure = (SyndEnclosure) enclosureList.get(n);
//                        System.out.println("流媒体播放文件：" + entry.getEnclosures());
//                    }
//                }
                spider.preUpdate();
        		dao.insert(spider);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
		
	}
	
	
	/**
	 * 更新索引
	 */
	public void createIndex(){
		//dao.createIndex();
	}
}
