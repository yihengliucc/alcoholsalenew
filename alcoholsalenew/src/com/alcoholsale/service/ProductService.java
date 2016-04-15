package com.alcoholsale.service;

import java.util.List;
import java.util.Map;

import com.alcoholsale.domain.TProduct;

public interface ProductService extends BaseService {
	/**
	 * 查询所有商品，pageSize和pageNow都为0的时候，查询出所有的商品（方便计算出pageCount）
	 * @param pageSize
	 * @param pageNow
	 * @return 返回所有商品的List
	 */
	public List queryProductByPage(int pageSize,int pageNow);
	/**
	 * 查询商品分页后的总页数
	 * @param pageSize 分页每页大小
	 * @return 页数整数
	 */
	public  int getPageCount(int pageSize);
	/**
	 * 通过ID找查找到商品
	 * @param proId 产品id
	 * @return 返回产品对象
	 */
	public TProduct getProductById(int proId) ;
	/**
	 * 统计商品情况
	 * @return
	 */
	public Map productStatistic();
}
