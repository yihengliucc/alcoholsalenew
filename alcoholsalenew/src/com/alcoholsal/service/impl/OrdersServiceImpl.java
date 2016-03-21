package com.alcoholsal.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
	public void addOrder(Integer productid, TUser user, 
			 TOrderitem torderitem) {
		try {
			TOrder order = new TOrder();
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
	public boolean payOrder(Integer orderid,Integer addid) {
		boolean success=false;
		try {
			Session session =this.getSessionFactory().getCurrentSession();
			Connection connection = session.connection();
			CallableStatement cs = connection.prepareCall("call p_pay_order");
			cs.setInt(1, orderid);
			cs.setInt(2, addid);
			cs.registerOutParameter(3, java.sql.Types.INTEGER);
			cs.execute();
			int ret = cs.getInt(3);
			System.out.println("=============存储返回值==========="+ret);
			if(ret==0)
		    success=true;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return success;
	}

	@Override
	public List<TOrder> queryNoSend(int pageNow, int pageSize) {
		String hql = "from TOrder where status<>1";
		List<TOrder> lst = this.getResultByPage(hql, null, pageSize, pageNow);
		return lst;
	}

	@Override
	public List<TOrder> querySend(int pageNow, int pageSize) {
		String hql = "from TOrder where status=1";
		List<TOrder> lst = this.getResultByPage(hql, null, pageSize, pageNow);
		return lst;
	}

	@Override
	public boolean sendOrder(Integer orderid) {
		TOrder torder=(TOrder) this.findById(TOrder.class, orderid);
		torder.setStatus(1);
		this.updateObject(torder);
		return false;
	}
	

}
