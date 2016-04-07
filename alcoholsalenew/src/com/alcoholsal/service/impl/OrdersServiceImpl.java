package com.alcoholsal.service.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import com.alcoholsale.domain.TAddress;
import com.alcoholsale.domain.TCartProduct;
import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TProduct;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.OrdersService;

public class OrdersServiceImpl extends BaseServiceImpl implements OrdersService {
	@Override
	public boolean payOrder(Integer orderid) {
		boolean success = false;
		try {
			Session session = this.getSessionFactory().getCurrentSession();
			Connection connection = session.connection();
			CallableStatement cs = connection.prepareCall("call p_pay_order");
			cs.setInt(1, orderid);
			cs.registerOutParameter(2, java.sql.Types.INTEGER);
			cs.execute();
			int ret = cs.getInt(2);
			System.out.println("=============存储返回值===========" + ret);
			if (ret == 0)
				success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	@Override
	public TOrder genOrder(TUser user, String addressId, String remark) {
		// 创建一个订单
		TOrder order = new TOrder();
		// 获取收人人地址对象
		TAddress address = (TAddress) this.findById(TAddress.class, Integer.parseInt(addressId));

		// 1. 订单用户
		order.setTUser(user);
		// 2. 订单生成日志
		order.setOrderdate(new java.util.Date());
		// 3. 订单状态
		order.setStatus(0);
		// 4. 付款日期--付款时添加
		// 5. 收货人地址
		order.setShippingAddress(address.getAddress());
		// 6. 收货人姓名
		order.setConsignee(address.getName());
		// 7. 收货人电话
		order.setPhone(address.getPhone());
		// 8. 订单备注
		order.setRemark(remark);
		// 9. 订单详情 -- 由于orderitems需要订单id，完成orderItem生成后插入
		// 10. 订单编号
		Date date = new java.util.Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("yyyyMMddHms");
		order.setOrderNo(dateFormater.format(date).toString());
		
		// 保存订单到数据库
		this.saveObject(order);
		
		return order;
	}

	@Override
	public List<TOrder> getMyOrder(TUser user) {
		String hql = "from TOrder where TUser = ? order by orderdate desc";
		Object obj[] = {user};
		return this.getResult(hql, obj);
	}
}
