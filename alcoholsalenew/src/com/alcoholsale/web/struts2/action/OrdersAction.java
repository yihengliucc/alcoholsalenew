package com.alcoholsale.web.struts2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.alcoholsale.domain.TOrder;
import com.alcoholsale.domain.TOrderitem;
import com.alcoholsale.domain.TUser;
import com.alcoholsale.service.OrdersService;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport implements ServletRequestAware{
	private OrdersService orderservice;
	private TOrder torder;
	private TOrderitem torderitem;
	private HttpServletRequest request;
	private Integer productid;
	private Integer taddr;
	public OrdersService getOrderservice() {
		return orderservice;
	}
	public void setOrderservice(OrdersService orderservice) {
		this.orderservice = orderservice;
	}
	public TOrder getTorder() {
		return torder;
	}
	public void setTorder(TOrder torder) {
		this.torder = torder;
	}
	public TOrderitem getTorderitem() {
		return torderitem;
	}
	public void setTorderitem(TOrderitem torderitem) {
		this.torderitem = torderitem;
	}
	//增加订单方法
	/**
	 * @return
	 */
	public String addOrder(){
		request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		TUser tuser = (TUser) session.getAttribute("user");
		orderservice.addOrder(productid, tuser, taddr, torder, torderitem);
		return SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
}
