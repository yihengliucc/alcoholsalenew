package com.alcoholsale.web.struts2.action;

import java.util.List;

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
	private Integer pageNow;
	private Integer pageSize;
	private HttpSession session;
	private Integer orderid;
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
	
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public Integer getTaddr() {
		return taddr;
	}
	public void setTaddr(Integer taddr) {
		this.taddr = taddr;
	}
	
	public Integer getPageNow() {
		return pageNow;
	}
	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	//增加订单方法
	/**
	 * @return
	 */
	public String addOrder(){
		request=ServletActionContext.getRequest();
		 session = request.getSession();
		TUser tuser = (TUser) session.getAttribute("user");
		orderservice.addOrder(productid, tuser, torderitem);
		return SUCCESS;
	}
	
	//查询未发放订单
	public String queryNoSendOrder(){
		request=ServletActionContext.getRequest();
		session = request.getSession();
		List<TOrder> nosendorder=orderservice.queryNoSend(pageNow, pageSize);
		session.setAttribute("nosendorder", nosendorder);
		return SUCCESS;
	}
	
	//查询已发放订单
		public String querySendOrder(){
			request=ServletActionContext.getRequest();
			session = request.getSession();
			List<TOrder> nosendorder=orderservice.querySend(pageNow, pageSize);
			session.setAttribute("sendorder", nosendorder);
			return SUCCESS;
		}
	//货物发送
		public String sendaction(){
			orderservice.sendOrder(orderid);
			return SUCCESS;
		}
	//查看所有的评论
		public String queryComment(){
			
			return SUCCESS;
		}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request=request;
	}
}
