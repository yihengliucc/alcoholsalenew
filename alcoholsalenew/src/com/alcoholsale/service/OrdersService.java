package com.alcoholsale.service;

import java.util.List;

import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TUser;

public interface OrdersService extends BaseService {
	//添加订单方法，需要传入参数商品id,用户对象user
	//详细信息对象
	public void addOrder(Integer productid,TUser user,TOrderitem torderitem);
	
	//订单结清方法 //参数订单编号
	public boolean payOrder(Integer orderid,Integer addid);
	
	//查询未发放订单
	public List<TOrder> queryNoSend(int pageNow,int pageSize);
	
	//查询y已发放订单
	public List<TOrder> querySend(int pageNow,int pageSize);
	
	//订单发送
	public boolean sendOrder(Integer orderid);
}
