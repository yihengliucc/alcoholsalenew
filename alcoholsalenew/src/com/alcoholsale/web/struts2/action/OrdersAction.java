package com.alcoholsale.web.struts2.action;

import com.alcoholsale.service.OrdersService;

public class OrdersAction {
	private OrdersService orderservice;

	public OrdersService getOrderservice() {
		return orderservice;
	}

	public void setOrderservice(OrdersService orderservice) {
		this.orderservice = orderservice;
	}
	
}
