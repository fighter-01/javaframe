/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.javamg.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;
import com.thinkgem.javamg.common.utils.excel.annotation.ExcelField;

/**
 * 部门落实党风廉政建设责任制年度量化考评表Entity
 * @author wht
 * @version 2017-06-10
 */
public class TbWorkInspect extends DataEntity<TbWorkInspect> {
	
	private static final long serialVersionUID = 1L;
	private String fgld;		// a3
	

	private Date inspectTime;		// a4
	private String a5;		// a5
	private String evaluate;
	private String problem;
	private String deptSign;		// 部门负责人签字
	private Date deptSignTime;		// 部门负责人签字日期
	private String hldSign;		// 分管行领导签字
	private Date hldSignTime;		// 分管行领导签字时间
	private String status;		// 审核状态
	private String createName;		// 提交者姓名
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型
	private Date beginDeptSignTime;		// 开始 部门负责人签字日期
	private Date endDeptSignTime;		// 结束 部门负责人签字日期
	private Date beginHldSignTime;		// 开始 分管行领导签字时间
	private Date endHldSignTime;		// 结束 分管行领导签字时间
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	private String status1;		// 审核状态
	private String status2;		// 审核状态
	private String status3;
	private String status4;
	private String status5;
	private String status6;
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
	
	public TbWorkInspect() {
		super();
	}

	public TbWorkInspect(String id){
		super(id);
	}
	
	@Length(min=0, max=64, message="分管行领导签字长度必须介于 0 和 64 之间")
	public String getFgld() {
		return fgld;
	}

	public void setFgld(String fgld) {
		this.fgld = fgld;
	}

	@Length(min=0, max=64, message="部门负责人签字长度必须介于 0 和 64 之间")
	public String getDeptSign() {
		return deptSign;
	}

	public void setDeptSign(String deptSign) {
		this.deptSign = deptSign;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDeptSignTime() {
		return deptSignTime;
	}

	public void setDeptSignTime(Date deptSignTime) {
		this.deptSignTime = deptSignTime;
	}
	
	@Length(min=0, max=64, message="分管行领导签字长度必须介于 0 和 64 之间")
	public String getHldSign() {
		return hldSign;
	}

	public void setHldSign(String hldSign) {
		this.hldSign = hldSign;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getHldSignTime() {
		return hldSignTime;
	}

	public void setHldSignTime(Date hldSignTime) {
		this.hldSignTime = hldSignTime;
	}
	
	@Length(min=0, max=1, message="审核状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	

	
	public Date getBeginDeptSignTime() {
		return beginDeptSignTime;
	}

	public void setBeginDeptSignTime(Date beginDeptSignTime) {
		this.beginDeptSignTime = beginDeptSignTime;
	}
	
	public Date getEndDeptSignTime() {
		return endDeptSignTime;
	}

	public void setEndDeptSignTime(Date endDeptSignTime) {
		this.endDeptSignTime = endDeptSignTime;
	}
		
	public Date getBeginHldSignTime() {
		return beginHldSignTime;
	}

	public void setBeginHldSignTime(Date beginHldSignTime) {
		this.beginHldSignTime = beginHldSignTime;
	}
	
	public Date getEndHldSignTime() {
		return endHldSignTime;
	}

	public void setEndHldSignTime(Date endHldSignTime) {
		this.endHldSignTime = endHldSignTime;
	}

	public String getStatus1() {
		return status1;
	}

	public void setStatus1(String status1) {
		this.status1 = status1;
	}

	public String getStatus2() {
		return status2;
	}

	public void setStatus2(String status2) {
		this.status2 = status2;
	}

	public String getStatus3() {
		return status3;
	}

	public void setStatus3(String status3) {
		this.status3 = status3;
	}

	public String getStatus4() {
		return status4;
	}

	public void setStatus4(String status4) {
		this.status4 = status4;
	}

	public String getStatus5() {
		return status5;
	}

	public void setStatus5(String status5) {
		this.status5 = status5;
	}

	public String getStatus6() {
		return status6;
	}

	public void setStatus6(String status6) {
		this.status6 = status6;
	}

	public String getEvaluate() {
		return evaluate;
	}

	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}

	public String getProblem() {
		return problem;
	}

	public void setProblem(String problem) {
		this.problem = problem;
	}


	public String getA5() {
		return a5;
	}

	public void setA5(String a5) {
		this.a5 = a5;
	}
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInspectTime() {
		return inspectTime;
	}

	public void setInspectTime(Date inspectTime) {
		this.inspectTime = inspectTime;
	}
		
}