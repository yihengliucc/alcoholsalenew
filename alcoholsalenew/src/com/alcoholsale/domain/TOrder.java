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
	private Date oderdate;
	private Integer status;
	private Date paydate;
	private String address;
	private String remark;	// 订单备注
	private Set<TOrderitem> orderitems;
	
	
	// setters and getters
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public Date getOderdate() {
		return oderdate;
	}
	public void setOderdate(Date oderdate) {
		this.oderdate = oderdate;
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