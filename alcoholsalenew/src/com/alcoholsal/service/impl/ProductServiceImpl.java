package com.alcoholsal.service.impl;

import java.util.List;

import com.alcoholsale.domain.TProduct;
import com.alcoholsale.service.ProductService;

public class ProductServiceImpl extends BaseServiceImpl implements ProductService {
	
	/**
	 * 可分页查询商品，参数均为0的时候查询所有商品（方便计算pageCount）
	 */
	@Override
	public List<TProduct> queryProductByPage(int pageSize,int pageNow) {
		String hql = " from TProduct order by proid";
		if(pageSize==0 && pageNow==0){      // 通过这种方式查询pageCount会出现每次需要查询所有商品的情况，严重影响性能
			List<TProduct> lst=this.getResult(hql, null);
			return lst;
		}else{
			List<TProduct> lst = this.getResultByPage(hql, null, pageSize, pageNow);
			return lst;
		}
	}

	@Override
	public int getPageCount(int pageSize) {
		String hql = "select count(*) from TProduct";
		int count = Integer.parseInt(this.getCount(hql, null).toString());
		return (count-1) / pageSize + 1;
	}

	@Override
	public TProduct getProductById(int proId) {
		return (TProduct) this.findById(TProduct.class, proId);
	}

	

}
