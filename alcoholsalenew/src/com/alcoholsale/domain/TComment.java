package com.alcoholsale.domain;

import java.util.Set;

public class TComment {
	private Integer tcommentid;
	private String commentmsg;
	private TProduct productid;
	private Set<TUserComment> tusercomment;
	public Integer getTcommentid() {
		return tcommentid;
	}
	public void setTcommentid(Integer tcommentid) {
		this.tcommentid = tcommentid;
	}
	public String getCommentmsg() {
		return commentmsg;
	}
	public void setCommentmsg(String commentmsg) {
		this.commentmsg = commentmsg;
	}
	public TProduct getProductid() {
		return productid;
	}
	public void setProductid(TProduct productid) {
		this.productid = productid;
	}
	public Set<TUserComment> getTusercomment() {
		return tusercomment;
	}
	public void setTusercomment(Set<TUserComment> tusercomment) {
		this.tusercomment = tusercomment;
	}
}
