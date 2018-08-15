/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;


import java.util.Date;

import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 举报Entity
 * 
 * @version 2013-01-15
 */
public class Report extends DataEntity<Report> {

	private static final long serialVersionUID = 1L;
	private String id;
	private String a_id;		// 消息ID
	private String title;	// 消息标题
	private Date report_time;// 举报时间
	private String report_type;//举报类型
	private String report_conetent;// 举报内容
	private String report_source;//举报来源 0 生活圈  1 排名
	private int report_frequency;//举报次数
	private String report_id;//举报人的ID
	private String proof;//举报的佐证材料
	private String reply;//举报的回复
	private int auditing;//审核状态
	private String result;//处理结果
	private int choice;

	public Report() {
		super();
	}
	
	public Report(String id){
		this();
		this.id = id;
	}

	@Override
	public String getId() {
		return id;
	}

	@Override
	public void setId(String id) {
		this.id = id;
	}
	
	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReport_time() {
		return report_time;
	}

	public String getReport_source() {
		return report_source;
	}

	public void setReport_source(String report_source) {
		this.report_source = report_source;
	}

	public void setReport_time(Date report_time) {
		this.report_time = report_time;
	}

	public String getReport_conetent() {
		return report_conetent;
	}

	public void setReport_conetent(String report_conetent) {
		this.report_conetent = report_conetent;
	}

	public int getReport_frequency() {
		return report_frequency;
	}

	public void setReport_frequency(int report_frequency) {
		this.report_frequency = report_frequency;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getAuditing() {
		return auditing;
	}

	public void setAuditing(int auditing) {
		this.auditing = auditing;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", a_id=" + a_id + ", title=" + title
				+ ", report_time=" + report_time + ", report_type="
				+ report_type + ", report_conetent=" + report_conetent
				+ ", report_source=" + report_source + ", report_frequency="
				+ report_frequency + ", report_id=" + report_id + ", proof="
				+ proof + ", reply=" + reply + ", auditing=" + auditing
				+ ", result=" + result + ", choice=" + choice + "]";
	}




	
	
}