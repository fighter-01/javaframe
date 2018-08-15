/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.validation.constraints.NotNull;
import com.thinkgem.javamg.modules.sys.entity.Office;

import com.thinkgem.javamg.common.persistence.DataEntity;
import com.thinkgem.javamg.common.utils.excel.annotation.ExcelField;

/**
 * 廉政教育谈话情况Entity
 * @author wht
 * @version 2017-06-03
 */
public class TbEducation extends DataEntity<TbEducation> {
	
	private static final long serialVersionUID = 1L;
	private String anchorman;		// 主谈人
	private String talkObject;		// 谈话对象
	private Date talkTime;		// 谈话时间
	private String talkPlace;		// 谈话地点
	private String talkReason;		// 谈话原因
	private String talkContent;		// 谈话记录
	private String talkPromise;		// 被谈人承诺
	private String createName;		// 提交者姓名
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型
	private Date beginTalkTime;		// 开始 谈话时间
	private Date endTalkTime;		// 结束 谈话时间
	private Date beginLrDate;		// 开始 录入时间
	private Date endLrDate;		// 结束 录入时间
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	
	
	
	@JsonIgnore
	@NotNull(message="归属公司不能为空")
	@ExcelField(title="归属公司", align=2, sort=20)
	public Office getCompany() {
		return company;
	}

	public void setCompany(Office company) {
		this.company = company;
	}
	
	@JsonIgnore
	@NotNull(message="归属部门不能为空")
	@ExcelField(title="归属部门", align=2, sort=25)
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	public TbEducation() {
		super();
	}

	public TbEducation(String id){
		super(id);
	}

	@Length(min=1, max=64, message="主谈人长度必须介于 1 和 64 之间")
	public String getAnchorman() {
		return anchorman;
	}

	public void setAnchorman(String anchorman) {
		this.anchorman = anchorman;
	}
	
	@Length(min=1, max=64, message="谈话对象长度必须介于 1 和 64 之间")
	public String getTalkObject() {
		return talkObject;
	}

	public void setTalkObject(String talkObject) {
		this.talkObject = talkObject;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="谈话时间不能为空")
	public Date getTalkTime() {
		return talkTime;
	}

	public void setTalkTime(Date talkTime) {
		this.talkTime = talkTime;
	}
	
	@Length(min=1, max=500, message="谈话地点长度必须介于 1 和 500 之间")
	public String getTalkPlace() {
		return talkPlace;
	}

	public void setTalkPlace(String talkPlace) {
		this.talkPlace = talkPlace;
	}
	
	@Length(min=1, max=1000, message="谈话原因长度必须介于 1 和 1000 之间")
	public String getTalkReason() {
		return talkReason;
	}

	public void setTalkReason(String talkReason) {
		this.talkReason = talkReason;
	}
	
	public String getTalkContent() {
		return talkContent;
	}

	public void setTalkContent(String talkContent) {
		this.talkContent = talkContent;
	}
	
	public String getTalkPromise() {
		return talkPromise;
	}

	public void setTalkPromise(String talkPromise) {
		this.talkPromise = talkPromise;
	}
	
	@Length(min=1, max=64, message="提交者姓名长度必须介于 1 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="录入时间不能为空")
	public Date getLrDate() {
		return lrDate;
	}

	public void setLrDate(Date lrDate) {
		this.lrDate = lrDate;
	}
	
	@Length(min=1, max=3, message="台账类型长度必须介于 1 和 3 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	
	public Date getBeginTalkTime() {
		return beginTalkTime;
	}

	public void setBeginTalkTime(Date beginTalkTime) {
		this.beginTalkTime = beginTalkTime;
	}
	
	public Date getEndTalkTime() {
		return endTalkTime;
	}

	public void setEndTalkTime(Date endTalkTime) {
		this.endTalkTime = endTalkTime;
	}
		
	public Date getBeginLrDate() {
		return beginLrDate;
	}

	public void setBeginLrDate(Date beginLrDate) {
		this.beginLrDate = beginLrDate;
	}
	
	public Date getEndLrDate() {
		return endLrDate;
	}

	public void setEndLrDate(Date endLrDate) {
		this.endLrDate = endLrDate;
	}
		
}