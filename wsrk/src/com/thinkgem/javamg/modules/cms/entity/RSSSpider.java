/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;


import java.util.Date;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 推送Entity
 * 
 * @version 2013-01-15
 */
public class RSSSpider extends DataEntity<RSSSpider> {

	private static final long serialVersionUID = 1L;
	private String id;		// 编号
	private String rss;	//	源编号
	private String title;	// 文章标题
	private String rssAbstract;// 文章摘要
	private String url;// 文章链接
	private String photo;// 缩略图
	private Date publiserTime;// 发布时间
	private String del_flag;

	public RSSSpider() {
		super();
	}
	
	public RSSSpider(String id){
		this();
		this.id = id;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public String getRss() {
		return rss;
	}

	public void setRss(String rss) {
		this.rss = rss;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRssAbstract() {
		return rssAbstract;
	}

	public void setRssAbstract(String rssAbstract) {
		this.rssAbstract = rssAbstract;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getPubliserTime() {
		return publiserTime;
	}

	public void setPubliserTime(Date publiserTime) {
		this.publiserTime = publiserTime;
	}
	
	
}