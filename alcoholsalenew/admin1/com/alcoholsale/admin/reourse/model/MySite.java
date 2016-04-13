package com.alcoholsale.admin.reourse.model;

import java.io.Serializable;

/**
 * 
 * @author CC
 * 2016年4月13日上午7:11:45
 */
public class MySite implements Serializable {
	private static final long serialVersionUID = 1L;	// 默认增加
	private Integer id;
	private Integer userid;
	private String sitename;
	private String title;
	private long createtime;
	private long lastlogin;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public long getCreatetime() {
		return createtime;
	}
	public void setCreatetime(long createtime) {
		this.createtime = createtime;
	}
	public long getLastlogin() {
		return lastlogin;
	}
	public void setLastlogin(long lastlogin) {
		this.lastlogin = lastlogin;
	}
}
