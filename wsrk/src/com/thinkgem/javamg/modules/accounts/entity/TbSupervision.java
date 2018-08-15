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
 * 接受监督情况Entity
 * @author wht
 * @version 2017-06-03
 */
public class TbSupervision extends DataEntity<TbSupervision> {
	
	private static final long serialVersionUID = 1L;
	private String reflectmanName;		// 被反映人
	private String reflectmanUnit;		// 反映人单位
	private Date reflectTime;		// 反映时间
	private String reflectWay;		// 反映形式
	private String reflectContent;		// 反映意见或建议
	private String abarbeitung;		// 整改落实情况
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
	public TbSupervision() {
		super();
	}

	public TbSupervision(String id){
		super(id);
	}

	@Length(min=1, max=64, message="被反映人长度必须介于 1 和 64 之间")
	public String getReflectmanName() {
		return reflectmanName;
	}

	public void setReflectmanName(String reflectmanName) {
		this.reflectmanName = reflectmanName;
	}
	
	@Length(min=1, max=100, message="反映人单位长度必须介于 1 和 100 之间")
	public String getReflectmanUnit() {
		return reflectmanUnit;
	}

	public void setReflectmanUnit(String reflectmanUnit) {
		this.reflectmanUnit = reflectmanUnit;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="反映时间不能为空")
	public Date getReflectTime() {
		return reflectTime;
	}

	public void setReflectTime(Date reflectTime) {
		this.reflectTime = reflectTime;
	}
	
	@Length(min=1, max=500, message="反映形式长度必须介于 1 和 500 之间")
	public String getReflectWay() {
		return reflectWay;
	}

	public void setReflectWay(String reflectWay) {
		this.reflectWay = reflectWay;
	}
	
	public String getReflectContent() {
		return reflectContent;
	}

	public void setReflectContent(String reflectContent) {
		this.reflectContent = reflectContent;
	}
	
	public String getAbarbeitung() {
		return abarbeitung;
	}

	public void setAbarbeitung(String abarbeitung) {
		this.abarbeitung = abarbeitung;
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