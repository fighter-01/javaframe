/**
 * 
 */
package com.thinkgem.javamg.modules.rmyhform.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.javamg.common.persistence.TreeEntity;

/**
 * 表单维护Entity
 * @author wht
 * @version 2016-09-20
 */
public class TbRmyhKhformInfo extends TreeEntity<TbRmyhKhformInfo>  implements Cloneable{
	
	private static final long serialVersionUID = 1L;
	private TbRmyhKhformInfo parent;		// 父级编号
	private String parentIds;		// 所有父级编号
	private String name;		// 列名
	private Integer sort;		// 排序
	private String allScore;		// 总分
	private String score;		// 得分
	private String kfReason;		// 扣分理由
	private String type;		// 表单列类型
	private Date khStartTime;		// 考核开始时间
	private Date khEndTime;		// 考核截止时间
	private String xfFlag;
	private int childSize;   //孩子节点数量
	private String flagId;   //插入到另一张表的标记id
	private List<TbRmyhKhformInfo> childrenList = new ArrayList<TbRmyhKhformInfo>();    // 子节点
	
	
	
	public TbRmyhKhformInfo() {
		super();
	}

	public TbRmyhKhformInfo(String id){
		super(id);
	}

	@JsonBackReference
	@NotNull(message="父级编号不能为空")
	public TbRmyhKhformInfo getParent() {
		return parent;
	}

	public void setParent(TbRmyhKhformInfo parent) {
		this.parent = parent;
	}
	
	@Length(min=1, max=2000, message="所有父级编号长度必须介于 1 和 2000 之间")
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}
	
	@Length(min=1, max=65535, message="所有父级编号长度必须介于 1 和 2000 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Length(min=0, max=100, message="总分长度必须介于 0 和 100 之间")
	public String getAllScore() {
		return allScore;
	}

	public void setAllScore(String allScore) {
		this.allScore = allScore;
	}
	
	@Length(min=0, max=100, message="得分长度必须介于 0 和 100 之间")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	public String getKfReason() {
		return kfReason;
	}

	public void setKfReason(String kfReason) {
		this.kfReason = kfReason;
	}
	
	@Length(min=1, max=1, message="表单列类型长度必须介于 1 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getKhStartTime() {
		return khStartTime;
	}

	public void setKhStartTime(Date khStartTime) {
		this.khStartTime = khStartTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	public Date getKhEndTime() {
		return khEndTime;
	}

	public void setKhEndTime(Date khEndTime) {
		this.khEndTime = khEndTime;
	}
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}

	public String getXfFlag() {
		return xfFlag;
	}

	public void setXfFlag(String xfFlag) {
		this.xfFlag = xfFlag;
	}

	/**
	 * @return the childrenList
	 */
	public List<TbRmyhKhformInfo> getChildrenList() {
		return childrenList;
	}

	/**
	 * @param childrenList the childrenList to set
	 */
	public void setChildrenList(List<TbRmyhKhformInfo> childrenList) {
		this.childrenList = childrenList;
	}

	/**
	 * @return the childSize
	 */
	public int getChildSize() {
		return childSize;
	}

	/**
	 * @param childSize the childSize to set
	 */
	public void setChildSize(int childSize) {
		this.childSize = childSize;
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