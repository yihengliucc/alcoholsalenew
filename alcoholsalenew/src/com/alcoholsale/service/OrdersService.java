package com.alcoholsale.service;

import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TUser;

public interface OrdersService extends BaseService {
	//添加订单方法，需要传入参数商品id,用户对象user
	//，收货地址id，订单对象，详细信息对象
	public void addOrder(Integer productid,TUser user,Integer addr,TOrder order,TOrderitem torderitem);
	
	//订单结清方法 //参数订单编号
	public boolean payOrder(Integer orderid);
}
