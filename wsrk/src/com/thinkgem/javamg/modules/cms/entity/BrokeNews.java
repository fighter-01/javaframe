/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;


import java.util.Date;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 举报Entity
 * 
 * @version 2013-01-15
 */
public class BrokeNews extends DataEntity<BrokeNews> {

	private static final long serialVersionUID = 1L;
	private String id;		// 消息ID
	private String b_id;	//	曝料人的ID
	private String name;	// 名称
	private String title;// 标题
	private Date b_time;// 时间
	private String b_addr;//地址
	private String b_content;//爆料内容
	private int choice;

	public BrokeNews() {
		super();
	}
	
	public BrokeNews(String id){
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public Date getB_time() {
		return b_time;
	}

	public void setB_time(Date b_time) {
		this.b_time = b_time;
	}

	public String getB_addr() {
		return b_addr;
	}

	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

	@Override
	public String toString() {
		return "BrokeNews [id=" + id + ", b_id=" + b_id + ", name=" + name
				+ ", title=" + title + ", b_time=" + b_time + ", b_addr="
				+ b_addr + ", b_content=" + b_content + ", choice=" + choice
				+ "]";
	}

	
	
}