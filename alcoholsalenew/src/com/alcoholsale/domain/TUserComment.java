package com.alcoholsale.domain;

public class TUserComment {
	private Integer id;
	private TUser tuser;
	private TComment tcomment;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public TUser getTuser() {
		return tuser;
	}
	public void setTuser(TUser tuser) {
		this.tuser = tuser;
	}
	public TComment getTcomment() {
		return tcomment;
	}
	public void setTcomment(TComment tcomment) {
		this.tcomment = tcomment;
	}
}
