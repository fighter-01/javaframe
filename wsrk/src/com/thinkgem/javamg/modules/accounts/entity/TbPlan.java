/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.javamg.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;
import com.thinkgem.javamg.common.utils.excel.annotation.ExcelField;

/**
 * 党风廉政建设工作计划及措施Entity
 * @author wht
 * @version 2017-06-01
 */
public class TbPlan extends DataEntity<TbPlan> {
	
	private static final long serialVersionUID = 1L;
	private String content;		// content
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型
	private String createName;		// create_name
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
	
	
	
	
	public TbPlan() {
		super();
	}

	public TbPlan(String id){
		super(id);
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	@Length(min=1, max=64, message="create_name长度必须介于 1 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
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