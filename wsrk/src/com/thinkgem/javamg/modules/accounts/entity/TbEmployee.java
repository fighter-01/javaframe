/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import com.thinkgem.javamg.common.persistence.DataEntity;
import com.thinkgem.javamg.common.utils.excel.annotation.ExcelField;
import com.thinkgem.javamg.modules.sys.entity.Office;

/**
 * 部门人员基本情况表Entity
 * @author wht
 * @version 2017-05-23
 */
public class TbEmployee extends DataEntity<TbEmployee> {
	
	private static final long serialVersionUID = 1L;
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	private String sex;		// 性别
	private String name;		// 姓名
	private String age;		// 年龄
	private String zw;		// 职务
	private String zzmm;		// 政治面貌
	private String whcd;		// 文化程度
	private Date drsj;		// 调入时间
	private String creatName ; //创建者姓名


	public String getCreatName() {
		return creatName;
	}

	public void setCreatName(String creatName) {
		this.creatName = creatName;
	}

	public TbEmployee() {
		super();
	}

	public TbEmployee(String id){
		super(id);
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
	
	@Length(min=0, max=1, message="性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=0, max=1000, message="姓名长度必须介于 0 和 1000 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=5, message="年龄长度必须介于 0 和 5 之间")
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@Length(min=0, max=1000, message="职务长度必须介于 0 和 1000 之间")
	public String getZw() {
		return zw;
	}

	public void setZw(String zw) {
		this.zw = zw;
	}
	
	@Length(min=0, max=1000, message="政治面貌长度必须介于 0 和 1000 之间")
	public String getZzmm() {
		return zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	
	@Length(min=0, max=1000, message="文化程度长度必须介于 0 和 1000 之间")
	public String getWhcd() {
		return whcd;
	}

	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDrsj() {
		return drsj;
	}

	public void setDrsj(Date drsj) {
		this.drsj = drsj;
	}
	
}