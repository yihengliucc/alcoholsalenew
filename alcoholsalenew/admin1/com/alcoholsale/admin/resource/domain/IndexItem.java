package com.alcoholsale.admin.resource.domain;

/**
 * 首页项
 * @author CC
 * 2016年4月12日下午12:27:31
 */
public class IndexItem {
	/**
	 * 
	 */
	private Integer IndexItemid;
	private String title;
	private String url;
	private int sort;
	/**
	 * 
	 * @return
	 */
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public Integer getIndexItemid() {
		return IndexItemid;
	}
	public void setIndexItemid(Integer indexItemid) {
		IndexItemid = indexItemid;
	}
}
