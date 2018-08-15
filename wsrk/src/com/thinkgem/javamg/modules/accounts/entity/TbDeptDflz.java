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
 * 部门组织的党风廉政建设活动Entity
 * @author wht
 * @version 2017-06-02
 */
public class TbDeptDflz extends DataEntity<TbDeptDflz> {
	
	private static final long serialVersionUID = 1L;
	private String activityName;		// 活动名称
	private Date activityTime;		// 活动时间
	private String activityPlace;		// 活动地点
	private String anchorman;		// 主 持 人
	private String personNum;		// 参加人数
	private String activityContent;		// 活动内容
	private String obtain;		// 成效
	private String createName;		// 提交者姓名
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型

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
	public TbDeptDflz() {
		super();
	}

	public TbDeptDflz(String id){
		super(id);
	}

	@Length(min=1, max=2000, message="活动名称长度必须介于 1 和 2000 之间")
	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="活动时间不能为空")
	public Date getActivityTime() {
		return activityTime;
	}

	public void setActivityTime(Date activityTime) {
		this.activityTime = activityTime;
	}
	
	@Length(min=1, max=1000, message="活动地点长度必须介于 1 和 1000 之间")
	public String getActivityPlace() {
		return activityPlace;
	}

	public void setActivityPlace(String activityPlace) {
		this.activityPlace = activityPlace;
	}
	
	@Length(min=1, max=50, message="主 持 人长度必须介于 1 和 50 之间")
	public String getAnchorman() {
		return anchorman;
	}

	public void setAnchorman(String anchorman) {
		this.anchorman = anchorman;
	}
	
	@Length(min=1, max=10, message="参加人数长度必须介于 1 和 10 之间")
	public String getPersonNum() {
		return personNum;
	}

	public void setPersonNum(String personNum) {
		this.personNum = personNum;
	}
	
	public String getActivityContent() {
		return activityContent;
	}

	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}
	
	public String getObtain() {
		return obtain;
	}

	public void setObtain(String obtain) {
		this.obtain = obtain;
	}
	
	@Length(min=1, max=64, message="提交者姓名长度必须介于 1 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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