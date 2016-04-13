package com.alcoholsale.admin.reourse;

import java.util.ArrayList;
import java.util.List;

import com.alcoholsal.service.impl.BaseServiceImpl;
import com.alcoholsale.admin.resource.domain.IndexItem;

public class IndexItemManager extends BaseServiceImpl implements
		IIndexItemManager {

	@Override
	public void add(IndexItem item) {
		this.saveObject(item);
	}

	@Override
	public List<IndexItem> list() {
		String hql = "from IndexItem order by sort";
		Object[] obj = null;
		return this.getResult(hql, obj);
	}

	@Override
	public void clean() {
		this.deleteAllObject("IndexItem");
	}

}
