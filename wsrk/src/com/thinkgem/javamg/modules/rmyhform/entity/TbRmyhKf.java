/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.javamg.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 扣分及扣分原因Entity
 * @author wht
 * @version 2016-10-15
 */
public class TbRmyhKf extends DataEntity<TbRmyhKf> {
	
	private static final long serialVersionUID = 1L;
	private String standId;		// stand_id
	private String officeId;		// office_id
	private String score;		// score
	private String kfreason;		// 扣分事由
	private String rev1;		// rev1
	private String flagId;
	public TbRmyhKf() {
		super();
	}

	public TbRmyhKf(String id){
		super(id);
	}

	@Length(min=1, max=64, message="stand_id长度必须介于 1 和 64 之间")
	public String getStandId() {
		return standId;
	}

	public void setStandId(String standId) {
		this.standId = standId;
	}
	
	
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	public String getKfreason() {
		return kfreason;
	}

	public void setKfreason(String kfreason) {
		this.kfreason = kfreason;
	}
	
	@Length(min=0, max=10, message="rev1长度必须介于 0 和 10 之间")
	public String getRev1() {
		return rev1;
	}

	public void setRev1(String rev1) {
		this.rev1 = rev1;
	}

	/**
	 * @return the officeId
	 */
	public String getOfficeId() {
		return officeId;
	}

	/**
	 * @param officeId the officeId to set
	 */
	public void setOfficeId(String officeId) {
		this.officeId = officeId;
	}

	/**
	 * @return the flagId
	 */
	public String getFlagId() {
		return flagId;
	}

	/**
	 * @param flagId the flagId to set
	 */
	public void setFlagId(String flagId) {
		this.flagId = flagId;
	}
	
}