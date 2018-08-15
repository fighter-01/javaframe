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
public class TbYear extends DataEntity<TbYear> {
	
	private static final long serialVersionUID = 1L;
	private String a1;		// a1
	private String a2;		// a2
	private String a3;		// a3
	private String a4;		// a4
	private String a5;		// a5
	private String a6;		// a6
	private String a7;		// a7
	private String a8;		// a8
	private String a9;		// a9
	private String a10;		// a10
	private String a11;		// a11
	private String a12;		// a12
	private String a13;		// a13
	private String a14;		// a14
	private String a15;		// a15
	private String a;		// a
	private String b;		// b
	private String c;		// c
	private String d;		// d
	private String e;		// e
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
	private TbHalfyearTable tbHalfyearTable;
	private String status1;		// 审核状态
	private String status2;		// 审核状态
	private String status3;
	private String status4;
	private String status5;
	private String status6;
	
	public TbHalfyearTable getTbHalfyearTable() {
		return tbHalfyearTable;
	}

	public void setTbHalfyearTable(TbHalfyearTable tbHalfyearTable) {
		this.tbHalfyearTable = tbHalfyearTable;
	}

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
	
	public TbYear() {
		super();
	}

	public TbYear(String id){
		super(id);
	}

	@Length(min=1, max=5, message="a1长度必须介于 1 和 5 之间")
	public String getA1() {
		return a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}
	
	@Length(min=1, max=5, message="a2长度必须介于 1 和 5 之间")
	public String getA2() {
		return a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}
	
	@Length(min=1, max=5, message="a3长度必须介于 1 和 5 之间")
	public String getA3() {
		return a3;
	}

	public void setA3(String a3) {
		this.a3 = a3;
	}
	
	@Length(min=1, max=5, message="a4长度必须介于 1 和 5 之间")
	public String getA4() {
		return a4;
	}

	public void setA4(String a4) {
		this.a4 = a4;
	}
	
	@Length(min=1, max=5, message="a5长度必须介于 1 和 5 之间")
	public String getA5() {
		return a5;
	}

	public void setA5(String a5) {
		this.a5 = a5;
	}
	
	@Length(min=1, max=5, message="a6长度必须介于 1 和 5 之间")
	public String getA6() {
		return a6;
	}

	public void setA6(String a6) {
		this.a6 = a6;
	}
	
	@Length(min=1, max=5, message="a7长度必须介于 1 和 5 之间")
	public String getA7() {
		return a7;
	}

	public void setA7(String a7) {
		this.a7 = a7;
	}
	
	@Length(min=1, max=5, message="a8长度必须介于 1 和 5 之间")
	public String getA8() {
		return a8;
	}

	public void setA8(String a8) {
		this.a8 = a8;
	}
	
	@Length(min=1, max=5, message="a9长度必须介于 1 和 5 之间")
	public String getA9() {
		return a9;
	}

	public void setA9(String a9) {
		this.a9 = a9;
	}
	
	@Length(min=1, max=5, message="a10长度必须介于 1 和 5 之间")
	public String getA10() {
		return a10;
	}

	public void setA10(String a10) {
		this.a10 = a10;
	}
	
	@Length(min=1, max=5, message="a11长度必须介于 1 和 5 之间")
	public String getA11() {
		return a11;
	}

	public void setA11(String a11) {
		this.a11 = a11;
	}
	
	@Length(min=1, max=5, message="a12长度必须介于 1 和 5 之间")
	public String getA12() {
		return a12;
	}

	public void setA12(String a12) {
		this.a12 = a12;
	}
	
	@Length(min=1, max=5, message="a13长度必须介于 1 和 5 之间")
	public String getA13() {
		return a13;
	}

	public void setA13(String a13) {
		this.a13 = a13;
	}
	
	@Length(min=0, max=5, message="a14长度必须介于 0 和 5 之间")
	public String getA14() {
		return a14;
	}

	public void setA14(String a14) {
		this.a14 = a14;
	}
	
	@Length(min=0, max=5, message="a15长度必须介于 0 和 5 之间")
	public String getA15() {
		return a15;
	}

	public void setA15(String a15) {
		this.a15 = a15;
	}
	
	@Length(min=1, max=5, message="a长度必须介于 1 和 5 之间")
	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}
	
	@Length(min=1, max=5, message="b长度必须介于 1 和 5 之间")
	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}
	
	@Length(min=1, max=5, message="c长度必须介于 1 和 5 之间")
	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}
	
	@Length(min=1, max=5, message="d长度必须介于 1 和 5 之间")
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
	
	@Length(min=1, max=5, message="e长度必须介于 1 和 5 之间")
	public String getE() {
		return e;
	}

	public void setE(String e) {
		this.e = e;
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
		
}