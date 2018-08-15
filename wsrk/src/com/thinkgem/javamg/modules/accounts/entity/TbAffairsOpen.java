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
 * 行(政)务公开情况Entity
 * @author wht
 * @version 2017-06-02
 */
public class TbAffairsOpen extends DataEntity<TbAffairsOpen> {
	
	private static final long serialVersionUID = 1L;
	private String openAffairs;		// 公开事项
	private Date openTime;		// 公开时间
	private String openWay;		// 公开形式
	private String openRange;		// 公开范围
	private String openContent;		// 公开的主要内容
	private String obtain;		// 群众意见或成效
	private String createName;		// 提交者姓名
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	private Date beginLrDate;		// 开始 录入时间
	private Date endLrDate;		// 结束 录入时间
	
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
	public TbAffairsOpen() {
		super();
	}

	public TbAffairsOpen(String id){
		super(id);
	}

	@Length(min=1, max=1000, message="公开事项长度必须介于 1 和 1000 之间")
	public String getOpenAffairs() {
		return openAffairs;
	}

	public void setOpenAffairs(String openAffairs) {
		this.openAffairs = openAffairs;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="公开时间不能为空")
	public Date getOpenTime() {
		return openTime;
	}

	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}
	
	@Length(min=1, max=1000, message="公开形式长度必须介于 1 和 1000 之间")
	public String getOpenWay() {
		return openWay;
	}

	public void setOpenWay(String openWay) {
		this.openWay = openWay;
	}
	
	@Length(min=1, max=1000, message="公开范围长度必须介于 1 和 1000 之间")
	public String getOpenRange() {
		return openRange;
	}

	public void setOpenRange(String openRange) {
		this.openRange = openRange;
	}
	
	public String getOpenContent() {
		return openContent;
	}

	public void setOpenContent(String openContent) {
		this.openContent = openContent;
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