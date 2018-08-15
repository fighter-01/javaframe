/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.javamg.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 台账评分Entity
 * @author wht
 * @version 2017-09-01
 */
public class TbAccountsScore extends DataEntity<TbAccountsScore> {
	
	private static final long serialVersionUID = 1L;
	private Date year;		// 年
	private String jidu;		// 季度
	private String score;		// score
	private String company;		// 归属支行
	private Office office;		// 归属部门
	private Date drsj;		// 调入时间
	private String officeId;
	
	public String getOfficeId() {
		return officeId;
	}

	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDrsj() {
		return drsj;
	}

	public void setDrsj(Date drsj) {
		this.drsj = drsj;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getYear() {
		return year;
	}
	
	public void setYear(String year) {
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy" );
	
		try {
			if(!year.equals("") && year != null){
				this.year = sdf.parse(year);
			}else{
				this.year = null;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public TbAccountsScore() {
		super();
	}

	public TbAccountsScore(String id){
		super(id);
	}
	
	
	
	@Length(min=1, max=255, message="季度长度必须介于 1 和 255 之间")
	public String getJidu() {
		return jidu;
	}

	public void setJidu(String jidu) {
		this.jidu = jidu;
	}
	
	public String getScore() {
		return score;
	}
	
	@Length(min=1, max=5, message="扣分长度必须介于 1 和 5 之间")
	public void setScore(String score) {
		this.score = score;
	}
	
	@Length(min=1, max=64, message="归属支行长度必须介于 1 和 64 之间")
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}
	
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
}