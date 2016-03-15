package com.alcoholsale.service;

import java.util.List;

public interface ProductService extends BaseService {
	public List queryProduct(int pageSize,int pageNow);
}
