/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhkh.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 考核表单名列表Entity
 * @author wht
 * @version 2016-09-19
 */
public class TbRmyhKhnameInfo extends DataEntity<TbRmyhKhnameInfo> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 考核表单名称
	private Date khStartTime;		// 考核开始时间
	private Date khEndTime;		// 考核截止日期
	
	public TbRmyhKhnameInfo() {
		super();
	}

	public TbRmyhKhnameInfo(String id){
		super(id);
	}

	@Length(min=1, max=255, message="考核表单名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="考核开始时间不能为空")
	public Date getKhStartTime() {
		return khStartTime;
	}

	public void setKhStartTime(Date khStartTime) {
		this.khStartTime = khStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="考核截止日期不能为空")
	public Date getKhEndTime() {
		return khEndTime;
	}

	public void setKhEndTime(Date khEndTime) {
		this.khEndTime = khEndTime;
	}
	
}