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
 * 参加机关党风廉政建设活动情况Entity
 * @author wht
 * @version 2017-06-02
 */
public class TbOfficeDflz extends DataEntity<TbOfficeDflz> {
	
	private static final long serialVersionUID = 1L;
	private String activityName;		// 活动名称
	private String organizer;		// 主办单位
	private Date activityTime;		// 时间
	private String personNum;		// 部门参加人数
	private String noCome;		// 未参加人员
	private String reason;		// 未参加原因
	private String activityContent;		// 活动内容
	private String obtain;		// 收获与体会
	private String explain;		// 说明
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
	
	public TbOfficeDflz() {
		super();
	}

	public TbOfficeDflz(String id){
		super(id);
	}

	@Length(min=1, max=2000, message="活动名称长度必须介于 1 和 2000 之间")
	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	
	@Length(min=1, max=2000, message="主办单位长度必须介于 1 和 2000 之间")
	public String getOrganizer() {
		return organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="时间不能为空")
	public Date getActivityTime() {
		return activityTime;
	}

	public void setActivityTime(Date activityTime) {
		this.activityTime = activityTime;
	}
	
	@Length(min=1, max=10, message="部门参加人数长度必须介于 1 和 10 之间")
	public String getPersonNum() {
		return personNum;
	}

	public void setPersonNum(String personNum) {
		this.personNum = personNum;
	}
	
	@Length(min=0, max=2000, message="未参加人员长度必须介于 0 和 2000 之间")
	public String getNoCome() {
		return noCome;
	}

	public void setNoCome(String noCome) {
		this.noCome = noCome;
	}
	
	@Length(min=0, max=2000, message="未参加原因长度必须介于 0 和 2000 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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
	
	@Length(min=0, max=2000, message="说明长度必须介于 0 和 2000 之间")
	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}
	
	@Length(min=0, max=64, message="提交者姓名长度必须介于 0 和 64 之间")
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
	
	@Length(min=0, max=3, message="台账类型长度必须介于 0 和 3 之间")
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