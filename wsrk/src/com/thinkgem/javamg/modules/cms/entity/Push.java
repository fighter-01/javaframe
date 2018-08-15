/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;

import java.util.Collection;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 推送Entity
 * 
 * @version 2013-01-15
 */
public class Push extends DataEntity<Push> {

	private static final long serialVersionUID = 1L;
	private String id;		// 编号
	private String type;	//推送类型     自定义消息或通知
	private String content;	// 内容
	private String platform;// 目标平台
	private String aliases;// 设备标签
	private String tagValues;// 推送别名
	private String registrationIds;// 推送设备号
	private String segments;// 推送组名
	private int status;//推送状态
	private Date create_date;
	private String del_flag;

	public Push() {
		super();
	}
	
	public Push(String id){
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

	@NotBlank
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getAliases() {
		return aliases;
	}

	public void setAliases(String aliases) {
		this.aliases = aliases;
	}

	public String getTagValues() {
		return tagValues;
	}

	public void setTagValues(String tagValues) {
		this.tagValues = tagValues;
	}

	public String getRegistrationIds() {
		return registrationIds;
	}

	public void setRegistrationIds(String registrationIds) {
		this.registrationIds = registrationIds;
	}

	public String getSegments() {
		return segments;
	}

	public void setSegments(String segments) {
		this.segments = segments;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDel_flag() {
		return del_flag;
	}

	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}