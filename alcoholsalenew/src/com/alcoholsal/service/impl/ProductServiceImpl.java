package com.alcoholsal.service.impl;

import java.util.List;

import com.alcoholsale.domain.TProduct;
import com.alcoholsale.service.ProductService;

public class ProductServiceImpl extends BaseServiceImpl implements ProductService {

	@Override
	public List queryProduct(int pageSize,int pageNow) {
		String hql = " from TProduct";
		if(pageSize==0 && pageNow==0){
			List<TProduct> lst=this.getResult(hql, null);
			return lst;
		}else{
			List<TProduct> lst = this.getResultByPage(hql, null, pageSize, pageNow);
			return lst;
		}
	}

	

}
