package com.alcoholsale.admin.reourse;

import java.util.List;

import com.alcoholsale.admin.resource.domain.IndexItem;

/**
 * 后台首页项管理 
 * @author CC
 * 2016年4月12日下午8:52:05
 */
public interface IIndexItemManager {
	/**
	 * 添加一个首页项
	 * @param item
	 */
	public void add(IndexItem item);
	
	
	/**
	 * 获取首页项列表
	 * @return
	 */
	public List<IndexItem> list();
	
	/**
	 * 清除首页项
	 * 一般用于站点安装时
	 */
	public void clean();
}
