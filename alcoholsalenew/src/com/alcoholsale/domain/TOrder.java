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

	private  Integer orderid;
	private TUser TUser;
	private TAddress addr;
	private Date oderdate;
	private  Integer status;
	private Date paydate;
	private TOrderitem orderitem;

	// Constructors

	/** default constructor */
	public TOrder() {
	}

	/** full constructor */
	public TOrder(TUser TUser, TAddress addr, Date oderdate, Integer status,
			Date paydate, TOrderitem orderitem) {
		this.TUser = TUser;
		this.addr = addr;
		this.oderdate = oderdate;
		this.status = status;
		this.paydate = paydate;
		this.orderitem = orderitem;
	}

	// Property accessors

	public Integer getOrderid() {
		return this.orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	public TAddress getAddr() {
		return addr;
	}

	public void setAddr(TAddress addr) {
		this.addr = addr;
	}

	public Date getOderdate() {
		return this.oderdate;
	}

	public void setOderdate(Date oderdate) {
		this.oderdate = oderdate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getPaydate() {
		return this.paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public TOrderitem getOrderitem() {
		return orderitem;
	}

	public void setOrderitem(TOrderitem orderitem) {
		this.orderitem = orderitem;
	}
}