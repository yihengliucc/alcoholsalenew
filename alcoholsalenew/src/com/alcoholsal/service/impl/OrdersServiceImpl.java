package com.alcoholsal.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.OrdersService;

public class OrdersServiceImpl extends BaseServiceImpl implements OrdersService {
	
	@Override
	public void addOrder(Integer productid, TUser user, Integer addr,
			TOrder order, TOrderitem torderitem) {
		try {
			//保存订单详细信息对象
			//1.查询相应的产品信息对象
			TProduct product = (TProduct) this.findById(TProduct.class, productid);
			//2.将商品对象添加到详细信息对象
			torderitem.setTProduct(product);
			//3.将详细信息对象保存
			this.saveObject(torderitem);
			//保存订单对象
			//1.将用户保存到订单信息对象
			order.setTUser(user);
			//2.查询出收货地对象
			TAddress address = (TAddress) this.findById(TAddress.class,addr);
			//3.将收货地添加到信息订单
			order.setAddr(address);
			//订单生成时间
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
			Date newdate = sdf.parse(sdf.format(date));
			order.setOderdate(newdate);
			//订单状态为3表示未发货
			order.setStatus(3);
			//添加订单详细信息对象
			order.setOrderitem(torderitem);
			//保存订单
			this.saveObject(order);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public boolean payOrder(Integer orderid) {
		boolean success=false;
		try {
			Session session =this.getSessionFactory().getCurrentSession();
			Connection connection = session.connection();
			CallableStatement cs = connection.prepareCall("call p_pay_order");
			cs.setInt(1, orderid);
			cs.registerOutParameter(2, java.sql.Types.INTEGER);
			cs.execute();
			int ret = cs.getInt(2);
			System.out.println("=============存储返回值==========="+ret);
			if(ret==0)
		    success=true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return success;
	}
	

}
