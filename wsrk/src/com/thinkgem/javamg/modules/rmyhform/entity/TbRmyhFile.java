/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.entity;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.javamg.modules.sys.entity.Office;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 考核文件Entity
 * @author wht
 * @version 2016-10-08
 */
public class TbRmyhFile extends DataEntity<TbRmyhFile> {
	
	private static final long serialVersionUID = 1L;
	private String khformId;		// khform_id
	private String officeId;
	private Office office;		// office_id
	private String fileUlr;		// file_ulr
	private String status;
	private String userName;
	private String allScore;
	private String formName;
	private TbRmyhKhformInfo tbRmyhKhformInfo;
	private String flagId;
	public TbRmyhFile() {
		super();
	}

	public TbRmyhFile(String id){
		super(id);
	}

	@Length(min=0, max=64, message="khform_id长度必须介于 0 和 64 之间")
	public String getKhformId() {
		return khformId;
	}

	public void setKhformId(String khformId) {
		this.khformId = khformId;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	public String getFileUlr() {
		return fileUlr;
	}

	public void setFileUlr(String fileUlr) {
		this.fileUlr = fileUlr;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the tbRmyhKhformInfo
	 */
	public TbRmyhKhformInfo getTbRmyhKhformInfo() {
		return tbRmyhKhformInfo;
	}

	/**
	 * @param tbRmyhKhformInfo the tbRmyhKhformInfo to set
	 */
	public void setTbRmyhKhformInfo(TbRmyhKhformInfo tbRmyhKhformInfo) {
		this.tbRmyhKhformInfo = tbRmyhKhformInfo;
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
	 * @return the allScore
	 */
	public String getAllScore() {
		return allScore;
	}

	/**
	 * @param allScore the allScore to set
	 */
	public void setAllScore(String allScore) {
		this.allScore = allScore;
	}

	/**
	 * @return the formName
	 */
	public String getFormName() {
		return formName;
	}

	/**
	 * @param formName the formName to set
	 */
	public void setFormName(String formName) {
		this.formName = formName;
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