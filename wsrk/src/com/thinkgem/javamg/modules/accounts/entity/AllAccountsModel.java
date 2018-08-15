/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import java.util.Date;

/**
 * <p>Title:AllAccountsModel</p>
 * <p>Description:  </p>
 * <p>Company:  </p>
 * @author 王宏涛
 * @date  2017-9-1
 */
public class AllAccountsModel {

	private String id;
	private String type;
	private String AccountType;		
	private Date submitTime;		// 季度
	private String SubmitPerson;		
	private String officeId;
	private Date beginLrDate;		// 开始 录入时间
	private Date endLrDate;		// 结束 录入时间
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getAccountType() {
		return AccountType;
	}
	public void setAccountType(String accountType) {
		AccountType = accountType;
	}
	
	public String getSubmitPerson() {
		return SubmitPerson;
	}
	public void setSubmitPerson(String submitPerson) {
		SubmitPerson = submitPerson;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOfficeId() {
		return officeId;
	}
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	
}
