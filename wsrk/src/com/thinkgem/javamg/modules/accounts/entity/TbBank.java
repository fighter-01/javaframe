/**
 * 
 */
package com.thinkgem.javamg.modules.accounts.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.javamg.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 个人有关金融事项报告表Entity
 * @author wht
 * @version 2017-09-26
 */
public class TbBank extends DataEntity<TbBank> {
	
	private static final long serialVersionUID = 1L;
	private String sex;		// sex
	private String name;		// name
	private String mz;		// 民族
	private String whcd;		// 学历
	private String department;		// 所在部门
	private String zw;		// 职务
	private String zzmm;		// 政治面貌
	private String zc;		// 职称
	private String hyzk;		// 婚姻状况
	private String jrhdCyr;		// 金融活动参与人
	private String jrhdHdmc;		// 金融活动_活动名称
	private String jrhdSjje;		// jrhd_sjje
	private String jrhdJtsj;		// 事件具体情况
	private String dkyqYjzl;		// 贷款逾期种类
	private String dkyqSjje;		// 贷款逾期涉及金额
	private String dkyqJrjgmc;		// 涉及金融机构名称
	private Date dkyqSj;		// 贷款逾期时间
	private Date dkyqBqssj;		// 被起诉时间
	private String dkyqBqjtqk;		// 事件具体情况
	private String mjjkSjje;		// 民间借款涉及金额
	private String mjjkXm;		// 债权人姓名
	private String mjjkGx;		// 与债权人的关系
	private Date mjjkSj;		// 逾期时间
	private String mjjkJtqk;		// 事件具体情况
	private String dbJe;		// 担保金额
	private String dbXm;		// 被担保人姓名（单位名称）
	private String dbGx;		// 与被担保人（单位）的关系
	private String dbSjjtqk;		// 事件具体情况
	private String creditJe;		// 涉及金额
	private String creditDeptname;		// 涉及金融机构名称
	private Date creditDate;		// 逾期时间
	private String creditName;		// 借卡人姓名
	private String creditGx;		// 与被借卡人（单位）的关系
	private String creditQk;		// 事件具体情况
	private String gmSjje;		// 涉及金额
	private String gmName;		// 购买金融产品（投资项目）名称
	private String gmXm;		// gm_xm
	private String gmGx;		// 与购买人的关系
	private String gmQk;		// 事件具体情况
	private String qtFx;		// 其他个人金融风险情况
	private Date bgrq;		// 报告日期
	private String bh;		// 有变化
	private Office company;	// 归属公司
	private Office office;	// 归属部门
	private Date beginBgrq;		// 开始 报告日期
	private Date endBgrq;		// 结束 报告日期
	
	public TbBank() {
		super();
	}

	public TbBank(String id){
		super(id);
	}

	@Length(min=1, max=1, message="sex长度必须介于 1 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@Length(min=1, max=1000, message="name长度必须介于 1 和 1000 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=1000, message="民族长度必须介于 1 和 1000 之间")
	public String getMz() {
		return mz;
	}

	public void setMz(String mz) {
		this.mz = mz;
	}
	
	@Length(min=1, max=1000, message="学历长度必须介于 1 和 1000 之间")
	public String getWhcd() {
		return whcd;
	}

	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	
	@Length(min=0, max=200, message="所在部门长度必须介于 0 和 200 之间")
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	@Length(min=1, max=1000, message="职务长度必须介于 1 和 1000 之间")
	public String getZw() {
		return zw;
	}

	public void setZw(String zw) {
		this.zw = zw;
	}
	
	@Length(min=1, max=1000, message="政治面貌长度必须介于 1 和 1000 之间")
	public String getZzmm() {
		return zzmm;
	}

	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	
	@Length(min=1, max=3, message="职称长度必须介于 1 和 3 之间")
	public String getZc() {
		return zc;
	}

	public void setZc(String zc) {
		this.zc = zc;
	}
	
	@Length(min=1, max=2, message="婚姻状况长度必须介于 1 和 2 之间")
	public String getHyzk() {
		return hyzk;
	}

	public void setHyzk(String hyzk) {
		this.hyzk = hyzk;
	}
	
	@Length(min=0, max=1, message="金融活动参与人长度必须介于 0 和 1 之间")
	public String getJrhdCyr() {
		return jrhdCyr;
	}

	public void setJrhdCyr(String jrhdCyr) {
		this.jrhdCyr = jrhdCyr;
	}
	
	@Length(min=0, max=1000, message="金融活动_活动名称长度必须介于 0 和 1000 之间")
	public String getJrhdHdmc() {
		return jrhdHdmc;
	}

	public void setJrhdHdmc(String jrhdHdmc) {
		this.jrhdHdmc = jrhdHdmc;
	}
	
	@Length(min=0, max=20, message="jrhd_sjje长度必须介于 0 和 20 之间")
	public String getJrhdSjje() {
		return jrhdSjje;
	}

	public void setJrhdSjje(String jrhdSjje) {
		this.jrhdSjje = jrhdSjje;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getJrhdJtsj() {
		return jrhdJtsj;
	}

	public void setJrhdJtsj(String jrhdJtsj) {
		this.jrhdJtsj = jrhdJtsj;
	}
	
	@Length(min=0, max=1, message="贷款逾期种类长度必须介于 0 和 1 之间")
	public String getDkyqYjzl() {
		return dkyqYjzl;
	}

	public void setDkyqYjzl(String dkyqYjzl) {
		this.dkyqYjzl = dkyqYjzl;
	}
	
	@Length(min=0, max=20, message="贷款逾期涉及金额长度必须介于 0 和 20 之间")
	public String getDkyqSjje() {
		return dkyqSjje;
	}

	public void setDkyqSjje(String dkyqSjje) {
		this.dkyqSjje = dkyqSjje;
	}
	
	@Length(min=0, max=200, message="涉及金融机构名称长度必须介于 0 和 200 之间")
	public String getDkyqJrjgmc() {
		return dkyqJrjgmc;
	}

	public void setDkyqJrjgmc(String dkyqJrjgmc) {
		this.dkyqJrjgmc = dkyqJrjgmc;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDkyqSj() {
		return dkyqSj;
	}

	public void setDkyqSj(Date dkyqSj) {
		this.dkyqSj = dkyqSj;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDkyqBqssj() {
		return dkyqBqssj;
	}

	public void setDkyqBqssj(Date dkyqBqssj) {
		this.dkyqBqssj = dkyqBqssj;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getDkyqBqjtqk() {
		return dkyqBqjtqk;
	}

	public void setDkyqBqjtqk(String dkyqBqjtqk) {
		this.dkyqBqjtqk = dkyqBqjtqk;
	}
	
	@Length(min=0, max=20, message="民间借款涉及金额长度必须介于 0 和 20 之间")
	public String getMjjkSjje() {
		return mjjkSjje;
	}

	public void setMjjkSjje(String mjjkSjje) {
		this.mjjkSjje = mjjkSjje;
	}
	
	@Length(min=0, max=10, message="债权人姓名长度必须介于 0 和 10 之间")
	public String getMjjkXm() {
		return mjjkXm;
	}

	public void setMjjkXm(String mjjkXm) {
		this.mjjkXm = mjjkXm;
	}
	
	@Length(min=0, max=20, message="与债权人的关系长度必须介于 0 和 20 之间")
	public String getMjjkGx() {
		return mjjkGx;
	}

	public void setMjjkGx(String mjjkGx) {
		this.mjjkGx = mjjkGx;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getMjjkSj() {
		return mjjkSj;
	}

	public void setMjjkSj(Date mjjkSj) {
		this.mjjkSj = mjjkSj;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getMjjkJtqk() {
		return mjjkJtqk;
	}

	public void setMjjkJtqk(String mjjkJtqk) {
		this.mjjkJtqk = mjjkJtqk;
	}
	
	@Length(min=0, max=20, message="担保金额长度必须介于 0 和 20 之间")
	public String getDbJe() {
		return dbJe;
	}

	public void setDbJe(String dbJe) {
		this.dbJe = dbJe;
	}
	
	@Length(min=0, max=200, message="被担保人姓名（单位名称）长度必须介于 0 和 200 之间")
	public String getDbXm() {
		return dbXm;
	}

	public void setDbXm(String dbXm) {
		this.dbXm = dbXm;
	}
	
	@Length(min=0, max=200, message="与被担保人（单位）的关系长度必须介于 0 和 200 之间")
	public String getDbGx() {
		return dbGx;
	}

	public void setDbGx(String dbGx) {
		this.dbGx = dbGx;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getDbSjjtqk() {
		return dbSjjtqk;
	}

	public void setDbSjjtqk(String dbSjjtqk) {
		this.dbSjjtqk = dbSjjtqk;
	}
	
	@Length(min=0, max=20, message="涉及金额长度必须介于 0 和 20 之间")
	public String getCreditJe() {
		return creditJe;
	}

	public void setCreditJe(String creditJe) {
		this.creditJe = creditJe;
	}
	
	@Length(min=0, max=200, message="涉及金融机构名称长度必须介于 0 和 200 之间")
	public String getCreditDeptname() {
		return creditDeptname;
	}

	public void setCreditDeptname(String creditDeptname) {
		this.creditDeptname = creditDeptname;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreditDate() {
		return creditDate;
	}

	public void setCreditDate(Date creditDate) {
		this.creditDate = creditDate;
	}
	
	@Length(min=0, max=200, message="借卡人姓名长度必须介于 0 和 200 之间")
	public String getCreditName() {
		return creditName;
	}

	public void setCreditName(String creditName) {
		this.creditName = creditName;
	}
	
	@Length(min=0, max=200, message="与被借卡人（单位）的关系长度必须介于 0 和 200 之间")
	public String getCreditGx() {
		return creditGx;
	}

	public void setCreditGx(String creditGx) {
		this.creditGx = creditGx;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getCreditQk() {
		return creditQk;
	}

	public void setCreditQk(String creditQk) {
		this.creditQk = creditQk;
	}
	
	@Length(min=0, max=200, message="涉及金额长度必须介于 0 和 200 之间")
	public String getGmSjje() {
		return gmSjje;
	}

	public void setGmSjje(String gmSjje) {
		this.gmSjje = gmSjje;
	}
	
	@Length(min=0, max=200, message="购买金融产品（投资项目）名称长度必须介于 0 和 200 之间")
	public String getGmName() {
		return gmName;
	}

	public void setGmName(String gmName) {
		this.gmName = gmName;
	}
	
	@Length(min=0, max=200, message="gm_xm长度必须介于 0 和 200 之间")
	public String getGmXm() {
		return gmXm;
	}

	public void setGmXm(String gmXm) {
		this.gmXm = gmXm;
	}
	
	@Length(min=0, max=200, message="与购买人的关系长度必须介于 0 和 200 之间")
	public String getGmGx() {
		return gmGx;
	}

	public void setGmGx(String gmGx) {
		this.gmGx = gmGx;
	}
	
	@Length(min=0, max=2000, message="事件具体情况长度必须介于 0 和 2000 之间")
	public String getGmQk() {
		return gmQk;
	}

	public void setGmQk(String gmQk) {
		this.gmQk = gmQk;
	}
	
	public String getQtFx() {
		return qtFx;
	}

	public void setQtFx(String qtFx) {
		this.qtFx = qtFx;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getBgrq() {
		return bgrq;
	}

	public void setBgrq(Date bgrq) {
		this.bgrq = bgrq;
	}
	
	@Length(min=0, max=1, message="有变化长度必须介于 0 和 1 之间")
	public String getBh() {
		return bh;
	}

	public void setBh(String bh) {
		this.bh = bh;
	}
	
	
	public Office getCompany() {
		return company;
	}

	public void setCompany(Office company) {
		this.company = company;
	}

	@NotNull(message="归属部门不能为空")
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	public Date getBeginBgrq() {
		return beginBgrq;
	}

	public void setBeginBgrq(Date beginBgrq) {
		this.beginBgrq = beginBgrq;
	}
	
	public Date getEndBgrq() {
		return endBgrq;
	}

	public void setEndBgrq(Date endBgrq) {
		this.endBgrq = endBgrq;
	}
		
}