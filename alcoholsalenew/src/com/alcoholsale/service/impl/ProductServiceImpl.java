package com.alcoholsale.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.alcoholsale.domain.TProduct;
import com.alcoholsale.service.ProductService;

public class ProductServiceImpl extends BaseServiceImpl implements ProductService {
	
	/**
	 * 可分页查询商品，参数均为0的时候查询所有商品（方便计算pageCount）
	 */
	@Override
	public List<TProduct> queryProductByPage(int pageSize,int pageNow) {
		String hql = " from TProduct where marketenable =1 order by proid";
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
		String hql = "select count(*) from TProduct where marketenable =1";
		int count = Integer.parseInt(this.getCount(hql, null).toString());
		return (count-1) / pageSize + 1;
	}

	@Override
	public TProduct getProductById(int proId) {
		return (TProduct) this.findById(TProduct.class, proId);
	}

	@Override
	public Map productStatistic() {
		// 计算上架和下架商品总数
		String hql = "select count(*) from TProduct where marketenable = ?";
		int saleCount = Integer.parseInt(this.getCount(hql, new Object[]{1}).toString());
		int unsaleCount = Integer.parseInt(this.getCount(hql, new Object[]{0}).toString());
		
		// 计算回收站商品数量(未实现)
		int disabledCount = 0;
		// 统计商品评论数
		hql = "select count(*) from TComment";
		int discussCount = Integer.parseInt(this.getCount(hql, null).toString());
		// 统计商品咨询数量（未实现）
		int askCount = 0;
		
		Map<String, Integer> map = new HashMap<String, Integer>(1);
		map.put("salecount", saleCount);
		map.put("unsalecount", unsaleCount);
		map.put("disabledcount", disabledCount);
		map.put("allcount", unsaleCount+saleCount);
		map.put("discuss", discussCount);
		map.put("ask", askCount);

		return map;
	}

}
