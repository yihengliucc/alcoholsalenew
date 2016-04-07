package com.alcoholsale.service;

import java.util.Date;
import java.util.List;
import java.util.Set;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TCartProduct;
import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TUser;

public interface OrdersService extends BaseService {
	//添加订单方法，需要传入参数商品id,用户对象user
	//，收货地址id，订单对象，详细信息对象
//	public void addOrder(Integer productid,TUser user,Integer addr,TOrder order,TOrderitem torderitem);
	/**
	 * 方法于2016年4月6日重构，添加订单备注等,改为生成一张订单
	 * @author CC
	 * @param user  		订单所属用户
	 * @param addressId		地址对象的id号
	 * @param remark		订单备注
	 * @param orderitems	订单详情集合
	 */
	public TOrder genOrder(TUser user, String addressId, String remark);
	
	//订单结清方法 //参数订单编号
	public boolean payOrder(Integer orderid);
	
	/**
	 * 按用户获取所有订单信息
	 * @param user  需要获取订单的用户对象
	 * @return	订单集合
	 */
	public List<TOrder> getMyOrder(TUser user);
}
