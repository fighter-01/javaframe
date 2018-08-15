/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;


import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 推送Entity
 * 
 * @version 2013-01-15
 */
public class RSSSource extends DataEntity<RSSSource> {

	private static final long serialVersionUID = 1L;
	private String id;		// 编号
	private String rssName;	//	源名称
	private String rssUrl;	// 原网址
	private String rssParser;// 对应解析方法
	private int refTime;// 时间间隔
	private String del_flag;

	public RSSSource() {
		super();
	}
	
	public RSSSource(String id){
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

	public String getRssName() {
		return rssName;
	}

	public void setRssName(String rssName) {
		this.rssName = rssName;
	}

	public String getRssUrl() {
		return rssUrl;
	}

	public void setRssUrl(String rssUrl) {
		this.rssUrl = rssUrl;
	}

	public String getRssParser() {
		return rssParser;
	}

	public void setRssParser(String rssParser) {
		this.rssParser = rssParser;
	}

	public int getRefTime() {
		return refTime;
	}

	public void setRefTime(int refTime) {
		this.refTime = refTime;
	}

	
	
}