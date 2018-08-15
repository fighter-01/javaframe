/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.entity;

import java.util.List;

/**
 * <p>Title:RowDataInfo</p>
 * <p>Description:  </p>
 * <p>Company:  </p>
 * @author 王宏涛
 * @date  2016-9-29
 */
public class RowDataInfo {
	 private String itemName;
	 private String itemScore;
	 private String contentName;
	 private String contentScore;
	 private String standId;
	 private String standName;
	 private String standScore;       //分值（扣除的分值）
	 private List<TbRmyhKhformInfo> fileDatail;
	 private List<TbRmyhKhformInfo>  jfbzList;  //计分标准
	 private String file;			//附件
	 private String df ;        //得分
	 private String kfReason;   //扣分事由
	 private String jfbzIds;
	 private int itemChildSize;
	 private int contentChildSize;
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemScore() {
		return itemScore;
	}
	public void setItemScore(String itemScore) {
		this.itemScore = itemScore;
	}
	public String getContentName() {
		return contentName;
	}
	public void setContentName(String contentName) {
		this.contentName = contentName;
	}
	public String getContentScore() {
		return contentScore;
	}
	public void setContentScore(String contentScore) {
		this.contentScore = contentScore;
	}
	public String getStandName() {
		return standName;
	}
	public void setStandName(String standName) {
		this.standName = standName;
	}
	public String getStandScore() {
		return standScore;
	}
	public void setStandScore(String standScore) {
		this.standScore = standScore;
	}
	

	
	public String getDf() {
		return df;
	}
	public void setDf(String df) {
		this.df = df;
	}
	public String getKfReason() {
		return kfReason;
	}
	public void setKfReason(String kfReason) {
		this.kfReason = kfReason;
	}
	public List<TbRmyhKhformInfo> getJfbzList() {
		return jfbzList;
	}
	public void setJfbzList(List<TbRmyhKhformInfo> jfbzList) {
		this.jfbzList = jfbzList;
	}
	/**
	 * @return the fileDatail
	 */
	public List<TbRmyhKhformInfo> getFileDatail() {
		return fileDatail;
	}
	/**
	 * @param fileDatail the fileDatail to set
	 */
	public void setFileDatail(List<TbRmyhKhformInfo> fileDatail) {
		this.fileDatail = fileDatail;
	}
	
	/**
	 * @return the itemChildSize
	 */
	public int getItemChildSize() {
		return itemChildSize;
	}
	/**
	 * @param itemChildSize the itemChildSize to set
	 */
	public void setItemChildSize(int itemChildSize) {
		this.itemChildSize = itemChildSize;
	}
	/**
	 * @return the contentChildSize
	 */
	public int getContentChildSize() {
		return contentChildSize;
	}
	/**
	 * @param contentChildSize the contentChildSize to set
	 */
	public void setContentChildSize(int contentChildSize) {
		this.contentChildSize = contentChildSize;
	}
	/**
	 * @return the standId
	 */
	public String getStandId() {
		return standId;
	}
	/**
	 * @param standId the standId to set
	 */
	public void setStandId(String standId) {
		this.standId = standId;
	}
	/**
	 * @return the file
	 */
	public String getFile() {
		return file;
	}
	/**
	 * @param file the file to set
	 */
	public void setFile(String file) {
		this.file = file;
	}
	/**
	 * @return the jfbzIds
	 */
	public String getJfbzIds() {
		return jfbzIds;
	}
	/**
	 * @param jfbzIds the jfbzIds to set
	 */
	public void setJfbzIds(String jfbzIds) {
		this.jfbzIds = jfbzIds;
	}
	

	
	
	 

}
