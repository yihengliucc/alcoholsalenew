package com.alcoholsale.service;

import java.io.Serializable;
import java.util.List;

public interface BaseService {
	//通用查询方法
	public Object findById(Class clazz,Serializable id);
	//通用集合查询
	public List getResult(String hql,Object[] parameters);
	//保存
	public void saveObject(Object obj);
	//删除对象
	public void deleteObject(Object obj);
	//修改对象
	public void updateObject(Object obj);
	//分页
	public List getResultByPage(String hql,Object[] parameters,int pageSize,int PageNow);
}
