package com.alcoholsale.domain;

import java.lang.Integer;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TOrder entity. @author MyEclipse Persistence Tools
 */

public class TOrder implements java.io.Serializable {

	// Fields

	private Integer orderid;
	private TUser TUser;
	private Date orderdate;
	private Integer status;				// 0 未付款   1已付款 2已取消 3待发货
	private Date paydate;				// 付款日期
	private String shippingAddress;		// 收货人地址不做成对象引用，因为如果删除会导致订单地址信息被删除
	private String consignee;			// 收件人姓名
	private String phone;				// 收货人电话
	private String remark;				// 订单备注
	private Set<TOrderitem> orderitems;
	private String orderNo; 					// 展示订单编号
	
	
	// setters and getters
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getRemark() {
		return remark;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public TUser getTUser() {
		return TUser;
	}
	public void setTUser(TUser tUser) {
		TUser = tUser;
	}

	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public Set<TOrderitem> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(Set<TOrderitem> orderitems) {
		this.orderitems = orderitems;
	}
	
}