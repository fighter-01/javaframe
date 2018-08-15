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
 * 部门落实党风廉政建设责任制情况半年自查表Entity
 * @author wht
 * @version 2017-06-04
 */
public class TbHalfyear extends DataEntity<TbHalfyear> {
	
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
	private String a14;		// a13
	private String a15;		// a13
	private String a;		// a
	private String b;		// b
	private String c;		// c
	private String d;		// d
	private String e;		// e
	private String sign;		// 部门负责人签字
	private Date signTime;		// 签字日期
	private String status;		// 审核状态
	private String createName;		// 提交者姓名
	private Date lrDate;		// 录入时间
	private String type;		// 台账类型
	private Date beginSignTime;		// 开始 签字日期
	private Date endSignTime;		// 结束 签字日期
	private Office company;	// 归属公司
	private Office office;	// 归属部门

	private TbHalfyearTable tbHalfyearTable;
	private String status1;		// 审核状态
	private String status2;		// 审核状态
	
	
	
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
	
	
	public TbHalfyear() {
		super();
	}

	public TbHalfyear(String id){
		super(id);
	}

	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA1() {
		return a1;
	}

	public void setA1(String a1) {
		this.a1 = a1;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA2() {
		return a2;
	}

	public void setA2(String a2) {
		this.a2 = a2;
	}
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA14() {
		return a14;
	}

	public void setA14(String a14) {
		this.a14 = a14;
	}
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA15() {
		return a15;
	}

	public void setA15(String a15) {
		this.a15 = a15;
	}

	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA3() {
		return a3;
	}

	public void setA3(String a3) {
		this.a3 = a3;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA4() {
		return a4;
	}

	public void setA4(String a4) {
		this.a4 = a4;
	}
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA5() {
		return a5;
	}

	public void setA5(String a5) {
		this.a5 = a5;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA6() {
		return a6;
	}

	public void setA6(String a6) {
		this.a6 = a6;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA7() {
		return a7;
	}

	public void setA7(String a7) {
		this.a7 = a7;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA8() {
		return a8;
	}

	public void setA8(String a8) {
		this.a8 = a8;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA9() {
		return a9;
	}

	public void setA9(String a9) {
		this.a9 = a9;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA10() {
		return a10;
	}

	public void setA10(String a10) {
		this.a10 = a10;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA11() {
		return a11;
	}

	public void setA11(String a11) {
		this.a11 = a11;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA12() {
		return a12;
	}

	public void setA12(String a12) {
		this.a12 = a12;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public String getA13() {
		return a13;
	}

	public void setA13(String a13) {
		this.a13 = a13;
	}
	
	@Length(min=1, max=5, message="得分长度必须介于 1 和 5 之间")
	public String getA() {
		return a;
	}

	public void setA(String a) {
		this.a = a;
	}
	
	@Length(min=1, max=5, message="得分长度必须介于 1 和 5 之间")
	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}
	
	@Length(min=1, max=5, message="得分长度必须介于 1 和 5 之间")
	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}
	
	@Length(min=1, max=5, message="得分长度必须介于 1 和 5 之间")
	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}
	
	@Length(min=1, max=5, message="得分长度必须介于 1 和 5 之间")
	public String getE() {
		return e;
	}

	public void setE(String e) {
		this.e = e;
	}
	
	@Length(min=0, max=64, message="部门负责人签字长度必须介于 0 和 64 之间")
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}
	
	@Length(min=1, max=1, message="审核状态长度必须介于 1 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=64, message="提交者姓名长度必须介于 1 和 64 之间")
	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	//@NotNull(message="录入时间不能为空")
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
	
	public Date getBeginSignTime() {
		return beginSignTime;
	}

	public void setBeginSignTime(Date beginSignTime) {
		this.beginSignTime = beginSignTime;
	}
	
	public Date getEndSignTime() {
		return endSignTime;
	}

	public void setEndSignTime(Date endSignTime) {
		this.endSignTime = endSignTime;
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
		
}