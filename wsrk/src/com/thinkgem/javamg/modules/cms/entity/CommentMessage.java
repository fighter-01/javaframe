/**
 * 
 */
package com.thinkgem.javamg.modules.cms.entity;


import com.thinkgem.javamg.common.persistence.DataEntity;

/**
 * 举报Entity
 * 
 * @version 2013-01-15
 */
public class CommentMessage extends DataEntity<CommentMessage> {

	private static final long serialVersionUID = 1L;
	private String id;		
	private String a_id;	// 消息ID
	private String mc_id;	//	评论人的ID
	private String name;	// 评论人的名称
	private String user_avator;//评论人的头像
	private String title;// 标题
	private String content;// 内容
	private String comment_source;//评论来源 0生活圈 1排名
	private int click_a_like;//点赞次数
	private String again_comment;//再次评论
	private String comment_nums;//评论数量
	private String img_url;//评论图片
	private int top_comment;//置顶评论 0不置顶 1置顶

	public CommentMessage() {
		super();
	}
	
	public CommentMessage(String id){
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMc_id() {
		return mc_id;
	}

	public void setMc_id(String mc_id) {
		this.mc_id = mc_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getClick_a_like() {
		return click_a_like;
	}

	public void setClick_a_like(int click_a_like) {
		this.click_a_like = click_a_like;
	}

	public String getAgain_comment() {
		return again_comment;
	}

	public void setAgain_comment(String again_comment) {
		this.again_comment = again_comment;
	}

	public String getComment_nums() {
		return comment_nums;
	}

	public void setComment_nums(String comment_nums) {
		this.comment_nums = comment_nums;
	}

	public int getTop_comment() {
		return top_comment;
	}

	public void setTop_comment(int top_comment) {
		this.top_comment = top_comment;
	}

	public String getUser_avator() {
		return user_avator;
	}

	public void setUser_avator(String user_avator) {
		this.user_avator = user_avator;
	}

	public String getComment_source() {
		return comment_source;
	}

	public void setComment_source(String comment_source) {
		this.comment_source = comment_source;
	}
	
	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	@Override
	public String toString() {
		return "CommentMessage [id=" + id + ", a_id=" + a_id + ", mc_id="
				+ mc_id + ", name=" + name + ", user_avator=" + user_avator
				+ ", title=" + title + ", content=" + content
				+ ", comment_source=" + comment_source + ", click_a_like="
				+ click_a_like + ", again_comment=" + again_comment
				+ ", comment_nums=" + comment_nums + ", img_url=" + img_url
				+ ", top_comment=" + top_comment + "]";
	}



	
	
}